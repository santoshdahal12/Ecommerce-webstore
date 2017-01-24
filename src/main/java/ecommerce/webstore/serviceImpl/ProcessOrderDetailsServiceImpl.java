package ecommerce.webstore.serviceImpl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ecommerce.webstore.domain.ProcessedOrderDetails;
import ecommerce.webstore.domain.Product;
import ecommerce.webstore.repository.ProcessedOrderDetailsRepository;
import ecommerce.webstore.service.ProcessedOrderDetailsService;

@Service
@Transactional
public class ProcessOrderDetailsServiceImpl implements ProcessedOrderDetailsService {

	@Autowired
	ProcessedOrderDetailsRepository processedOrderDetailsRepository;
	@Override
	public ProcessedOrderDetails saveProduct(ProcessedOrderDetails processedOrderDetails) {
		// TODO Auto-generated method stub
		return processedOrderDetailsRepository.save(processedOrderDetails);
	}
	
	@Override
	public ProcessedOrderDetails findOne(long id) {
		// TODO Auto-generated method stub
		return processedOrderDetailsRepository.findOne(id);
	}

}
