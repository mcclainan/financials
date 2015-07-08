package org.macsuite.financial.category

class SpecialCategoryLabel {
    String label
    Category category
    static constraints = {
        label unique: true
    }
}
