package ecommerce.webstore.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
/*
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;*/
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ecommerce.webstore.domain.Credentials;
import ecommerce.webstore.domain.Member;
import ecommerce.webstore.repository.CredentialsRepository;
import ecommerce.webstore.service.CredentialsService;

@Service
@Transactional
public class CredentialsServiceImpl implements CredentialsService {

	@Autowired
	private CredentialsRepository credentialsRepository;

	public void save(Credentials credentials) {

		/*
		 * PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); String
		 * encodedPassword = passwordEncoder.encode(credentials.getPassword());
		 * credentials.setPassword(encodedPassword);
		 */

		credentialsRepository.save(credentials);
	}

	public List<Credentials> findAll() {
		return (List<Credentials>) credentialsRepository.findAll();
	}

	@Override
	public void deleteCredentials(String username) {
		// TODO Auto-generated method stub
		credentialsRepository.delete(username);
		// credentialsRepository.findAll();

	}

	@Override
	public Credentials updateCredentials(Member member, String password) {
		Credentials credentials = member.getCredentials();
		credentials.setPassword(password);
		Credentials newCredentials = credentialsRepository.save(credentials);
		return newCredentials;
	}

}
