package ecommerce.webstore.serviceImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ecommerce.webstore.domain.Order;
import ecommerce.webstore.domain.OrderLine;
import ecommerce.webstore.repository.OrderRepository;
import ecommerce.webstore.service.IOrderService;

@Service
@Transactional
public class OrderServiceImpl implements IOrderService {

	@Autowired
	OrderRepository orderRepository;


	@Override
	public Order saveOrder(Order order) {
		return orderRepository.saveAndFlush(order);
	}


	@Override
	public Order getOrderForPerson(String username) {
		return orderRepository.findOrderForPerson(username);
	}


	@Override
	public void deleteOrder(Order order) {
		orderRepository.delete(order);
	}



	/*@Override
	public Order getOrderForPerson(long id) {
		return orderRepository.findOrderForPerson(id);
	}*/

}
