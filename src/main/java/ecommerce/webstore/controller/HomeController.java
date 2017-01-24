package ecommerce.webstore.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ecommerce.webstore.domain.Authority;
import ecommerce.webstore.domain.Category;
import ecommerce.webstore.domain.Member;
import ecommerce.webstore.domain.Order;
import ecommerce.webstore.domain.OrderLine;
import ecommerce.webstore.service.IOrderService;
import ecommerce.webstore.service.MemberService;
import ecommerce.webstore.service.ProductService;

@Controller
@SessionAttributes("currentorder")
public class HomeController {
	@Autowired
	ProductService productService;

	@Autowired
	MemberService memberService;

	@Autowired
	IOrderService orderService;

	@RequestMapping("/")
	public String login(Model model) {
		return "login";
	}

	@RequestMapping("/dashboard1")
	public String home1(Model model, Authentication authentication, HttpServletRequest request, Principal user, HttpSession session) {
		model.addAttribute("products", productService.findAllProducts());

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		for (GrantedAuthority a : authorities) {
			if (a.getAuthority().equals("farmer")) {
				return "redirect:product";
			}
			if (a.getAuthority().equals("admin")) {
				return "dashboardAdmin";
			}
		}
		Member member = memberService.findByUserName(user.getName()).get(0);
		
		//for intial cart check
		Order currentorder = (Order) session.getAttribute("currentorder");
		if (currentorder == null) {
			if(member.getOrder()==null)
				return "customerdashboard";
			currentorder = member.getOrder();
			session.setAttribute("currentorder", currentorder);
		}
		model.addAttribute("orderLines", currentorder.getOrderLineList());
		
		return "customerdashboard";

	}

	@RequestMapping("/logout_farmer")
	public String logout(HttpServletRequest servletRequest) throws ServletException {
		servletRequest.logout();
		return "redirect:";
	}

}
