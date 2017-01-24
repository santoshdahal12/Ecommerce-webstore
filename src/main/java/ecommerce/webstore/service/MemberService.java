package ecommerce.webstore.service;

import java.util.List;

import ecommerce.webstore.domain.Authority;
import ecommerce.webstore.domain.Member;

public interface MemberService {
	public Authority getAuthorityForUser(String name);

	public void deleteMember(Long id);

	public List<Member> getAll();

	public Member getUser(Long id);

	public void save(Member member);

	public List<Member> findByUserName(String username);
}
