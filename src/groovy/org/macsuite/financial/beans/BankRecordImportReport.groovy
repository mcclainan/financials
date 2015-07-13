package org.macsuite.financial.beans

import org.macsuite.financial.banking.BankRecord

/**
 * Created by tony on 7/12/15.
 */
class BankRecordImportReport {
    String batchNumber
    Integer numberImported
    List<BankRecord> duplicates
}
