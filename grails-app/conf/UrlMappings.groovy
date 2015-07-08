import grails.util.Holders
import org.apache.commons.lang.StringUtils

class UrlMappings {

    static mappings = {
        def app
        def adminControllers = []

        '/'(controller: 'home')


        // default admin page
        '/admin'(controller: 'adminHome')
        '/transaction'(controller: 'transactionHome')
        '/basic_table'(view: 'basic_table')
        '/indexExample'(view: 'indexExample')
        '/blank'(view: 'blank')
        '/404'(view: '404')
        '/buttons'(view: 'buttons')
        '/chart'(view: 'chart')
        '/form_component'(view: 'form_component')
        '/form_validation'(view: 'form_validation')
        '/general'(view: 'general')
        '/grids'(view: 'grids')
        '/login' (view: 'login')
        '/profile'   (view: 'profile')
        '/widgets'   (view: 'widgets')
        '/calendar'   (view: 'calendar')


        // Populate the admin controllers
        Holders.grailsApplication.controllerClasses.findAll{ c -> c.logicalPropertyName.startsWith('admin') }.each { c ->
            String uriName = StringUtils.uncapitalize(c.logicalPropertyName.toString().replaceFirst('^admin', ''))
            "/admin/${uriName}/$action?/$id?"(controller: c.logicalPropertyName)
        }

        // Populate the transaction controllers
        Holders.grailsApplication.controllerClasses.findAll{ c -> c.logicalPropertyName.startsWith('transaction') }.each { c ->
            String uriName = StringUtils.uncapitalize(c.logicalPropertyName.toString().replaceFirst('^transaction', ''))
            "/transaction/${uriName}/$action?/$id?"(controller: c.logicalPropertyName)
        }

        "/$controller/$action?/$id?" {
            constraints {
                controller(validator: {
                    ! it.startsWith('admin')
                    ! it.startsWith('transaction')
                });
            }
        }
    }
}
