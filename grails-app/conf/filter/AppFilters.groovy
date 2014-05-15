package filter

class AppFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                println("params:  ${params}")
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
