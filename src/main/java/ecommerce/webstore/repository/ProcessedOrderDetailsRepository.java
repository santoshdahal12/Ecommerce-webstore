/**
 * 
 */
package ecommerce.webstore.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ecommerce.webstore.domain.ProcessedOrderDetails;

/**
 * @author santosh dahal
 *
 */
@Repository
public interface ProcessedOrderDetailsRepository extends CrudRepository<ProcessedOrderDetails,Long>{

}
