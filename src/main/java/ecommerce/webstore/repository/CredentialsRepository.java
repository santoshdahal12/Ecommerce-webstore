package ecommerce.webstore.repository;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ecommerce.webstore.domain.Credentials;





	@Repository
	public interface CredentialsRepository extends  CrudRepository<Credentials, String> 
	{
  	}

