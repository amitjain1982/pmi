import com.intelligrape.pmi.util.BootstrapService
import org.apache.commons.logging.LogFactory

class BootStrap {
    private static final LOGGER = LogFactory.getLog(this)


    BootstrapService bootstrapService
    def init = { servletContext ->
        LOGGER.info("****************************initialising PMI app****************************")
        bootstrapService.initialize()
        LOGGER.info("****************************initialised PMI app****************************")
    }

    def destroy = {
        LOGGER.info("****************************destroy PMI app****************************")
    }

}
