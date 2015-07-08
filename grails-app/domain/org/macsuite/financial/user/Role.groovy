package org.macsuite.financial.user

class Role {

	String authority

	static mapping = {
		cache true
		table 'role_data'
		datasource 'auth'

	}

	static constraints = {
		authority blank: false, unique: true
	}
}
