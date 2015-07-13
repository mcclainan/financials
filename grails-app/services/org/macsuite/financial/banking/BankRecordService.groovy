package org.macsuite.financial.banking

import grails.transaction.Transactional
import org.macsuite.financial.beans.BankRecordImportReport
import org.macsuite.financial.exception.AppException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest

import java.text.ParseException
import java.text.SimpleDateFormat

@Transactional
class BankRecordService {

    /**Takes an uploaded file and reads the data into the bank record tab
     * @param request the HTTP request map
     * @param flash the object that comes with the call to grails controller
     * @Param account the org.macsuite.financial.tracking.Account object
     */
    def upload(MultipartFile file,Account account) {
        ImportFormat importFormat = account.importFormat
        String batchNumber = new Date().format("yyyyMMddHHmmss")
        List newFile = []
        Integer importCount = 0
        List<BankRecord> duplicates = []
        Integer size
        file.inputStream.eachLine{
            //Get the input stream of a file that is taken from the request
            List row = it.split(",")//Split each line into elements delimited by comma
            newFile << row //Add the list as an element in the new file
            size=row.size()
        }
        int i = 0
        if(importFormat.hasHeading){
            i=1
        }

        for(i;i<newFile.size();i++){
            BankRecord bankRecord
            try{
                //Get the values from the file
                def row = newFile[i]
                bankRecord = new BankRecord(batch: batchNumber,account:account)
                bankRecord.date = new SimpleDateFormat(importFormat.dateFormat).parse(row.get(importFormat.dateColumn))
                bankRecord.description = row[importFormat.descriptionColumn]

                if(importFormat.hasMultipleAmountColumns){
                    if(row.get(importFormat.debitColumn)){
                        bankRecord.amount = new BigDecimal(row.get(importFormat.debitColumn).replace('"', "")).abs()
                    }else{
                        bankRecord.amount = new BigDecimal(row.get(importFormat.creditColumn).replace('"', "")).abs()
                    }
                }else{
                    bankRecord.amount = new BigDecimal(row.get(importFormat.amountColumn).replace('"', "")).abs()
                }
            }
            catch (Exception e){
                e.printStackTrace()
                throw new AppException("An error occured while trying to process your file at line ${i}.", 'danger')
            }
            if(bankRecord.validate()){
                bankRecord.save(flush: true,failOnError: true)
                importCount++
            }else{
                duplicates<<bankRecord
            }
        }
        return new BankRecordImportReport(batchNumber:batchNumber,numberImported: importCount, duplicates: duplicates)
    }


    def serializeDuplicate(Map params){
        Integer year = params.year.toInteger()
        Integer month = params.month.toInteger()
        Integer day = params.day.toInteger()
        String batch = params.batch
        String description = params.desciption
        BigDecimal amount = new BigDecimal(params.amount.toString())

        Calendar calendar = new GregorianCalendar(year,month,day)
        BankRecord bankRecord = new BankRecord(date: calendar.time, amount:amount,batch:batch,description:"${description} 1")
        bankRecord.save(flush:true)
    }

    def deleteBatch(String batch){
        BankRecord.findAllByBatch(batch).each {record->
            if(!record.transactions || record.transactions?.size()<1){
                record.delete(flush: true)
            }
        }
    }
}
