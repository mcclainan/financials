package org.macsuite.financial.banking

import grails.validation.Validateable

/**
 * Created by tony on 7/14/15.
 */
@Validateable
class ReconValidateCommand {
    Long reconId
    Integer reconType
    Long recordId
}
