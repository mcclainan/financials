package org.macsuite.financial.banking

class SpecialAccountLabel {
    String label
    Account account
    static constraints = {
        label unique: true
    }
}
