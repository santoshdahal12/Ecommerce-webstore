package ecommerce.webstore.service;

import java.util.List;

import ecommerce.webstore.domain.Product;

public interface ProductService {
	public Product saveProduct(Product product);
	public Product findOne(long id);
	public List<Product> findAllProducts();
	public Product update(Product product);
	public void delete(long id);
	Product findByName(String productname);
	
}
