package ecommerce.webstore.logging;

import org.springframework.stereotype.Component;

@Component
public class ProductLogger implements ILogger {

	@Override
	public void log(String logstring) {
		java.util.logging.Logger log = java.util.logging.Logger.getLogger("Product Logger");
		log.info(logstring);
	}
}
