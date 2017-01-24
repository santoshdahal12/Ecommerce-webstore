package ecommerce.webstore.service;

import java.util.List;

import ecommerce.webstore.domain.Order;
import ecommerce.webstore.domain.OrderLine;

public interface IOrderService {
	public Order saveOrder(Order order);

	public Order getOrderForPerson(String username);

	public void deleteOrder(Order order);

}
