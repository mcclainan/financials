package org.macsuite.financial.exception

/**
 * Created by tony on 6/16/15.
 */

class AppException extends Exception{
    String status

    AppException(String message,String status){
        super(message)
        this.status=status
    }
}
