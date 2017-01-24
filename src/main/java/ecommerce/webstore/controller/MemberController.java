/**
 * 
 */
package ecommerce.webstore.controller;

import java.io.File;
import java.security.Principal;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecommerce.webstore.domain.Credentials;
import ecommerce.webstore.domain.Member;
import ecommerce.webstore.service.CredentialsService;
import ecommerce.webstore.service.MemberService;

/**
 * @author santosh dahal
 *
 */
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	@Autowired
	CredentialsService credentialsService;
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = { "/memberform" }, method = RequestMethod.POST)
	public String saveUser(@Valid @ModelAttribute("member") Member member, BindingResult result,
			RedirectAttributes rAttributes) {
		if (result.hasErrors()) {
			return "member";
		}

		MultipartFile userImage = member.getImage();
		String rootDirectory = servletContext.getRealPath("/");

		// isEmpty means file exists BUT NO Content
		if (userImage != null && !userImage.isEmpty()) {
			try {
				userImage
						.transferTo(new File(rootDirectory +"\\images\\"+ member.getFirstName() + ".jpg"));
			} catch (Exception e) {
				System.out.println(e);
				throw new RuntimeException(" Image saving failed", e);
			}
		}
		memberService.save(member);
		rAttributes.addFlashAttribute("member", member);
		return "redirect:success";

	}

	@RequestMapping(value = { "/success" }, method = RequestMethod.GET)
	public String showSecondForm() {
		return "membersaved";
	}

	@RequestMapping("/memberform")
	public String memberform(@ModelAttribute("member") Member member) throws ServletException {
		return "member";
	}

	@RequestMapping(value = { "/updates" }, method = RequestMethod.GET)
	public String updateMember(@RequestParam("id") Long id, Model model) {
		System.out.println("Inside update +id=" + id);
		// Long id=Long.parseLong(idNum);
		Member member = memberService.getUser(id);
		System.out.println(member.getId());

		// set user as model attribute to pre-populate the form
		model.addAttribute("member", member);
		// send over our form
		return "memberupdate";
	}

	@RequestMapping(value = { "/delete" }, method = RequestMethod.GET)
	public String deleteMember(@RequestParam("id") Long id, Model model) {

		memberService.deleteMember(id);

		// set user as model attribute to pre-populate the form
		model.addAttribute("recorddeleted", " your records have been deleted");
		// send over our form
		return "membersaved";
	}

	@RequestMapping(value = { "/getCredentials" }, method = RequestMethod.GET)
	@ResponseBody
	public Credentials getMemberCredentials(@RequestParam("password") String password, Model model, Principal user) {

		Credentials credentials = credentialsService
				.updateCredentials(memberService.findByUserName(user.getName()).get(0), password);

		System.out.println(credentials.getPassword() + "username" + credentials.getUsername());
		return credentials;
	}

}
