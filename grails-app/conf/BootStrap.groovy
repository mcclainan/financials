import grails.util.Environment
import org.macsuite.financial.user.UserRole
import org.macsuite.financial.banking.Account
import org.macsuite.financial.banking.AccountType
import org.macsuite.financial.banking.ImportFormat
import org.macsuite.financial.banking.SpecialAccountLabel
import org.macsuite.financial.category.MainCategory
import org.macsuite.financial.category.Category
import org.macsuite.financial.category.SpecialCategoryLabel
import org.macsuite.financial.planning.PlannedTransaction
import org.macsuite.financial.tracking.Transaction
import org.macsuite.financial.tracking.TransactionComboGroup
import org.macsuite.financial.user.Role
import org.macsuite.financial.user.User


class BootStrap {

    Role role
    User user

    def init = { servletContext ->
//        switch (Environment.current){
//            case Environment.DEVELOPMENT:
//                createDevData()
//                break
//            case Environment.TEST:
//                createDevData()
//                break
//            case Environment.PRODUCTION:
////                createAdmin()
//                createRequiredEntries()
//                break
//            default:
//                createRequiredEntries()
//        }
//        createRoles()
//        createAdmin()
    }

    def createDevData(){
        createRequiredEntries()
        createRoles()
        createAdmin()
        createMainCategory()
        createBanking()
        createTransactions()
        createPlanning()
    }

    def createRequiredEntries(){
        MainCategory mainCategory = MainCategory.findByName('Transfers')?:new MainCategory(name:'Transfers', description: 'Transfers money from one account to another.').save(flush: true, failOnError: true)
        Category category = Category.findByName('Transfer Out')?: new Category(mainCategory:mainCategory, name:'Transfer Out',cash: true,type: 'E').save(failOnError: true)
        new SpecialCategoryLabel(label: 'transferOut', category:category).save(flush: true, failOnError: true)
        category = Category.findByName('Transfer In')?: new Category(mainCategory:mainCategory, name:'Transfer In',cash: true,type: 'I').save(failOnError: true)
        new SpecialCategoryLabel(label: 'transferIn', category:category).save(flush: true, failOnError: true)

        ImportFormat importFormat = ImportFormat.findByName('none')?:new ImportFormat(name:'none',dateColumn:0,descriptionColumn:0,amountColumn:0)
        importFormat.save(flush: true)
        AccountType type=AccountType.findByType('Cash')?:new AccountType(type: 'Cash',resourceType:'cash').save(failOnError: true)
        def account = Account.findByTitle('Cash')?:new Account(title: 'Cash', balance: new BigDecimal('0.00'),type:type,importFormat:importFormat).save(failOnError: true)
        if(!SpecialAccountLabel.findByLabel('cash')){
            new SpecialAccountLabel(label:'cash',account:account).save(failOnError: true)
        }
    }

    def createRoles(){
        Role.findByAuthority('ROLE_ADMIN')?:new Role(authority:'ROLE_ADMIN').save(failOnError:true)
        Role.findByAuthority('ROLE_FINANCIAL_USER')?:new Role(authority:'ROLE_FINANCIAL_USER').save(failOnError:true)
        Role.findByAuthority('ROLE_FINANCIAL_PLANNER')?:new Role(authority:'ROLE_FINANCIAL_PLANNER').save(failOnError:true)
    }
    def createAdmin(){
        role = Role.findByAuthority('ROLE_ADMIN')
        user = User.findByUsername('super')?:new User(username:'super',firstName: "Admin", lastName: 'User', email: 'mcclainan@gmail.com', enabled:true,password:'FinancialKingdom').save(failOnError:true)
        if(!user.authorities.contains(role)){
            UserRole.create(user,role,true)
        }
        role = Role.findByAuthority('ROLE_FINANCIAL_USER')
        if(!user.authorities.contains(role)){
            UserRole.create(user,role,true)
        }
        role = Role.findByAuthority('ROLE_FINANCIAL_PLANNER')
        if(!user.authorities.contains(role)){
            UserRole.create(user,role,true)
        }
    }

    def createMainCategory(){
        log.debug("Creating Main Categories")
        def mainCategory = new MainCategory(name: 'Food').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Groceries',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Fast Food',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Dinning Out',cash: true,type: 'E').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Clothing').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'New Clothing',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Used Clothing',cash: true,type: 'E').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Housing').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Rent',cash: true,type: 'E',required: true).save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Power',cash: true,type: 'E',required: true).save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Water',cash: true,type: 'E',required: true).save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Gas',cash: true,type: 'E',required: true).save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Trash',cash: true,type: 'E',required: true).save(failOnError: true)
        mainCategory = new MainCategory(name: 'Fees').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'NSF',cash: true,type: 'E').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Transportation').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Fuel',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Maintenance',cash: true,type: 'E').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Communications').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Cable',cash: true,type: 'E',required: true).save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Phone',cash: true,type: 'E',required: true).save(failOnError: true)
        mainCategory = new MainCategory(name: 'Medical').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Co-pays',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Medication',cash: true,type: 'E').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Education').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Tuition',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Books',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Supplies',cash: true,type: 'E').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Financing').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Cars 4 U',cash: true,type: 'E',required: true).save(failOnError: true)
        mainCategory = new MainCategory(name: 'Child Care').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Day Care',cash: true,type: 'E',required: true).save(failOnError: true)
        mainCategory = new MainCategory(name: 'Entertainment').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Movies',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Skating',cash: true,type: 'E').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Memberships').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Netflix',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Hulu',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Lynda',cash: true,type: 'E').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Job').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Nic Pay',cash: true,type: 'I').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Business Income',cash: true,type: 'I').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Investment').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'401K',cash: true,type: 'E').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Miscellaneous').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Miscellaneous Expense',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Miscellaneous Income',cash: true,type: 'I').save(failOnError: true)
        mainCategory = new MainCategory(name: 'Untracked').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Untracked Expense',cash: true,type: 'E').save(failOnError: true)
        new Category(mainCategory:mainCategory, name:'Untracked income',cash: true,type: 'I').save(failOnError: true)
    }

    def createBanking(){
        ImportFormat importFormat = new ImportFormat(name:'USAA',dateColumn:1,descriptionColumn:2,amountColumn:3)
        importFormat.save(flush: true)
        AccountType type=new AccountType(type: 'Bank',resourceType:'cash').save(failOnError: true)
        new Account(title: 'Spending', balance: new BigDecimal('50.00'),type:type,importFormat:importFormat).save(failOnError: true)
        new Account(title: 'Deposit', balance: new BigDecimal('1000.00'),type:type,importFormat:importFormat).save(failOnError: true)
        def account = new Account(title: 'Cash', balance: new BigDecimal('20.00'),type:type,importFormat:importFormat).save(failOnError: true)
        new SpecialAccountLabel(label:'cash',account:account).save(failOnError: true)
//        type=new AccountType(type:'IRA',resourceType: 'investment').save(failOnError: true)
//        new Account(title: 'Kic IRA', balance: new BigDecimal('4500.00'),type:type,importFormat:importFormat).save(failOnError: true)
    }

    def createTransactions(){

        //Singles
        def account = Account.findByTitle('Spending')
        def category = Category.findByName('Groceries')

        new Transaction(category:category ,
                account: account,
                location: 'Walmart',
                date: new Date(),
                amount: new BigDecimal('20')).save(flush: true,failOnError: true)
        new Transaction(category:category ,
                account: account,
                location: 'Walmart',
                date: new Date()-30,
                amount: new BigDecimal('25.90')).save(flush: true,failOnError: true)
        new Transaction(category:category ,
                account: account,
                location: 'Walmart',
                date: new Date()-7,
                amount: new BigDecimal('147.00')).save(flush: true,failOnError: true)
        new Transaction(category:category ,
                account: account,
                location: 'Dillons',
                date: new Date()-3,
                amount: new BigDecimal('6.80')).save(flush: true,failOnError: true)
        new Transaction(category:category ,
                account: account,
                location: 'Walmart',
                date: new Date()-1,
                amount: new BigDecimal('45.23')).save(flush: true,failOnError: true)
        new Transaction(category:category ,
                account: account,
                location: 'Walmart',
                date: new Date()-5,
                amount: new BigDecimal('3.11')).save(flush: true,failOnError: true)

        category = Category.findByName('Fuel')
        new Transaction(category:category ,
                account: account,
                location: 'Sams',
                date: new Date()-7,
                amount: new BigDecimal('34.19')).save(flush: true,failOnError: true)
        new Transaction(category:category ,
                account: account,
                location: 'Sams',
                date: new Date()-14,
                amount: new BigDecimal('24.61')).save(flush: true,failOnError: true)
        new Transaction(category:category ,
                account: account,
                location: 'Sams',
                date: new Date()-21,
                amount: new BigDecimal('20.62')).save(flush: true,failOnError: true)
        new Transaction(category:category ,
                account: account,
                location: 'Sams',
                date: new Date()-28,
                amount: new BigDecimal('27.65')).save(flush: true,failOnError: true)


        category = Category.findByName('Business Income')
        new Transaction(category:category ,
                account: account,
                location: 'Client',
                date: new Date()-15,
                amount: new BigDecimal('20')).save(flush: true,failOnError: true)

        account = Account.findByTitle('Deposit')
        category = Category.findByName('Nic Pay')
        new Transaction(category:category ,
                account: account,
                location: 'Paycheck',
                date: new Date()-14,
                amount: new BigDecimal('1000')).save(flush: true,failOnError: true)

        //Combos
        account = Account.findByTitle('Spending')
        Date comboDate = new Date()-15
        TransactionComboGroup group = new TransactionComboGroup(total: new BigDecimal("80.00"), type:'combo',date: comboDate,account: account, location: 'Walmart').save(flush: true)
        new Transaction(category:Category.findByName('Groceries') ,
                account: account,
                location: 'Walmart',
                date: comboDate,
                comboGroup: group,
                amount: new BigDecimal('20')).save(flush: true,failOnError: true)

        new Transaction(category:Category.findByName('New Clothing') ,
                account: account,
                location: 'Walmart',
                date: comboDate,
                comboGroup: group,
                amount: new BigDecimal('60')).save(flush: true,failOnError: true)

        comboDate = new Date()-6
        group = new TransactionComboGroup(total:new BigDecimal("111.00") , type:'combo',date: comboDate,account: account, location: 'Walmart').save(flush: true,failOnError: true)
        new Transaction(category:Category.findByName('Groceries') ,
                account: account,
                location: 'Walmart',
                date: comboDate,
                comboGroup: group,
                amount: new BigDecimal('82.00')).save(flush: true,failOnError: true)

        new Transaction(category:Category.findByName('Gas') ,
                account: account,
                location: 'Walmart',
                date: comboDate,
                comboGroup: group,
                amount: new BigDecimal('36.21')).save(flush: true,failOnError: true)
        new Transaction(category:Category.findByName('Books') ,
                account: account,
                location: 'Walmart',
                date: comboDate,
                comboGroup: group,
                amount: new BigDecimal('14.99')).save(flush: true,failOnError: true)

        //Account Transfer
        account = Account.findByTitle('Spending')
        def account1 = Account.findByTitle('Deposit')
        def inCategory = SpecialCategoryLabel.findByLabel("transferIn").category
        def outCategory = SpecialCategoryLabel.findByLabel("transferOut").category
        comboDate = new Date()-13
        group=new TransactionComboGroup(date:comboDate,account:account1,location:"transfer",total: new BigDecimal("50.00"),type:'transfer').save(flush: true, failOnError: true)
        new Transaction(category:inCategory,
                account: account,
                location: 'transfer',
                date: comboDate,
                comboGroup: group,
                amount: new BigDecimal('50.00')).save(flush: true,failOnError: true)

        new Transaction(category:outCategory,
                account: account1,
                location: 'transfer',
                date: comboDate,
                comboGroup: group,
                amount: new BigDecimal('50')).save(flush: true,failOnError: true)

        comboDate = new Date()-3
        group=new TransactionComboGroup(date:comboDate,account:account1,location:"transfer",total: new BigDecimal("131.50"),type:'transfer').save(flush: true, failOnError: true)
        new Transaction(category:inCategory,
                account: account,
                location: 'cash withdrawal',
                date: comboDate,
                comboGroup: group,
                amount: new BigDecimal('130.00')).save(flush: true,failOnError: true)

        new Transaction(category:outCategory,
                account: account1,
                location: 'cash withdrawal',
                date: comboDate,
                comboGroup: group,
                amount: new BigDecimal('131.50')).save(flush: true,failOnError: true)

    }

    def createPlanning(){
        Category category = Category.findByName('Groceries')
        for(int i=0;i<90;i++){
            Date date = new Date()
            Calendar calendar = new GregorianCalendar(date.getAt(Calendar.YEAR),date.getAt(Calendar.MONTH),1)
            new PlannedTransaction(category:category,date: calendar.getTime()+i,amount: new BigDecimal('50')).save(flush: true, failOnError: true)
        }

        category = Category.findByName('Fuel')
        for(int i=1;i<14;i++){
            Date date = new Date()
            Calendar calendar = new GregorianCalendar(date.getAt(Calendar.YEAR),date.getAt(Calendar.MONTH),1)
            new PlannedTransaction(category:category,date: calendar.getTime()+(i*7),amount: new BigDecimal('40')).save(flush: true, failOnError: true)
        }

        category = Category.findByName('Rent')
        for(int i=0;i<3;i++){
            Date date = new Date()
            Integer year = date.format('yyyy').toInteger()
            Integer month = date.format('MM').toInteger()+i
            Calendar calendar = new GregorianCalendar(year,month-1,1)
            new PlannedTransaction(category:category,date:calendar.getTime(),amount: new BigDecimal('850')).save(flush: true, failOnError: true)
        }

        category = Category.findByName('Power')
        for(int i=0;i<3;i++){
            Date date = new Date()
            Integer year = date.format('yyyy').toInteger()
            Integer month = date.format('MM').toInteger()+i-1
            Calendar calendar = new GregorianCalendar(year,month,11)
            new PlannedTransaction(category:category,date:calendar.getTime(),amount: new BigDecimal('200')).save(flush: true, failOnError: true)
        }

        category = Category.findByName('Water')
        for(int i=0;i<3;i++){
            Date date = new Date()
            Integer year = date.format('yyyy').toInteger()
            Integer month = date.format('MM').toInteger()+i-1
            Calendar calendar = new GregorianCalendar(year,month,5)
            new PlannedTransaction(category:category,date:calendar.getTime(),amount: new BigDecimal('70')).save(flush: true, failOnError: true)
        }

        category = Category.findByName('Gas')
        for(int i=0;i<3;i++){
            Date date = new Date()
            Integer year = date.format('yyyy').toInteger()
            Integer month = date.format('MM').toInteger()+i-1
            Calendar calendar = new GregorianCalendar(year,month,11)
            new PlannedTransaction(category:category,date:calendar.getTime(),amount: new BigDecimal('80')).save(flush: true, failOnError: true)
        }

        category = Category.findByName('Trash')
        for(int i=0;i<3;i++){
            Date date = new Date()
            Integer year = date.format('yyyy').toInteger()
            Integer month = date.format('MM').toInteger()+i-1
            Calendar calendar = new GregorianCalendar(year,month,1)
            new PlannedTransaction(category:category,date:calendar.getTime(),amount: new BigDecimal('15')).save(flush: true, failOnError: true)
        }

        category = Category.findByName('Nic Pay')
        for(int i=0;i<3;i++){
            Date date = new Date()
            Integer year = date.format('yyyy').toInteger()
            Integer month = date.format('MM').toInteger()+i-1
            Calendar calendar = new GregorianCalendar(year,month,1)
            new PlannedTransaction(category:category,date:calendar.getTime(),amount: new BigDecimal('1500')).save(flush: true, failOnError: true)
            calendar = new GregorianCalendar(year,month,15)
            new PlannedTransaction(category:category,date:calendar.getTime(),amount: new BigDecimal('1500')).save(flush: true, failOnError: true)
        }
    }
}
