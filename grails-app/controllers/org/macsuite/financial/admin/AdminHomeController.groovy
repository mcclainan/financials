package org.macsuite.financial.admin

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AdminHomeController {

    def index() {

    }
}
