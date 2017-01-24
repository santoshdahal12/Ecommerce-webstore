package ecommerce.webstore.serviceImpl;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ecommerce.webstore.domain.Authority;
import ecommerce.webstore.domain.Member;
import ecommerce.webstore.repository.MemberRepository;
import ecommerce.webstore.service.CredentialsService;
import ecommerce.webstore.service.MemberService;

@Service
@Transactional

public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberRepository memberRepository;
	@Autowired
	CredentialsService credentialsService;

	@Override
	public void save(Member member) {
		// TODO Auto-generated method stub

		credentialsService.save(member.getCredentials());
		memberRepository.save(member);

	}

	@Override
	public List<Member> findByUserName(String username) {
		// TODO Auto-generated method stub
		return memberRepository.findByUserame(username);
	}

	@Override
	public Authority getAuthorityForUser(String name) {
		return memberRepository.getAuthorityByUsername(name);
	}

	@Override
	public void deleteMember(Long id) {
		Member member = memberRepository.findOne(id);
		// member.setCredentials(null);
		credentialsService.deleteCredentials(member.getCredentials().getUsername());
		memberRepository.delete(id);

	}

	@Override
	public List<Member> getAll() {
		// TODO Auto-generated method stub
		return (List<Member>) memberRepository.findAll();
	}

	@Override
	public Member getUser(Long id) {
		// TODO Auto-generated method stub
		return memberRepository.findOne(id);
	}

}
