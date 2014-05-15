import com.intelligrape.pmi.Role
import com.intelligrape.pmi.User
import com.intelligrape.pmi.UserRole

class BootStrap {

    def init = { servletContext ->

//        Role adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError: true, flush: true)
//        Role userRole = new Role(authority: 'ROLE_USER').save(failOnError: true, flush: true)
//
//
//
//
//        User admin = new User(username: 'shikha', password: '1234', accountExpired: false, accountLocked: false, passwordExpired: false, enabled: true).save(failOnError: true, flush: true)
//        User user = new User(username: 'mithu', password: '5678', accountExpired: false, accountLocked: false, passwordExpired: false, enabled: true).save(failOnError: true, flush: true)
//
//        UserRole userRole1 = new UserRole(user: admin, role: adminRole).save(failOnError: true, flush: true)
//        UserRole userRole2 = new UserRole(user: user, role: userRole).save(failOnError: true, flush: true)

    }
    def destroy = {
    }
}
