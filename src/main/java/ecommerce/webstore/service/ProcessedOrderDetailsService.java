package ecommerce.webstore.service;

import ecommerce.webstore.domain.ProcessedOrderDetails;


public interface ProcessedOrderDetailsService {
	public ProcessedOrderDetails saveProduct(ProcessedOrderDetails processedOrderDetails);

	ProcessedOrderDetails findOne(long id);
}
