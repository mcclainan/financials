package org.macsuite.financial.beans

import org.macsuite.financial.banking.Account

/**
 * Created by tony on 7/13/15.
 */
class ReconBean{
    static final Integer TRANSACTION = 1
    static final Integer COMBO = 2
    Long id
    Integer type
    Date date
    String location
    Account account
    BigDecimal amount


}

