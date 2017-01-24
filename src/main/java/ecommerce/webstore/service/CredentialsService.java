package ecommerce.webstore.service;

import java.util.List;

import ecommerce.webstore.domain.Credentials;
import ecommerce.webstore.domain.Member;



 
public interface CredentialsService {

	public void save(Credentials credentials);
	public List<Credentials> findAll();
	public void deleteCredentials(String username);
	public Credentials updateCredentials(Member member,String  password);
 }
