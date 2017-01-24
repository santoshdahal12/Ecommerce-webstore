package ecommerce.webstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import ecommerce.webstore.domain.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product,Long>{
	@Modifying
	@Query("delete from Product product where product.id=:id")
	void customDeleteProduct(@Param("id") long id);

	@Query("select p from Product p where p.name =:name")
	List<Product> findByName(@Param("name") String name);
}
