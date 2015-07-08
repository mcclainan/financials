package org.macsuite.financial.category

class MainCategory{
    String name
    String description
    Boolean active = true

    static hasMany = [categories:Category]

    static constraints = {
        name unique: true
        description nullable: true
    }

    static mapping = {
        sort('name')
    }

    public String toString(){
        name
    }
}
