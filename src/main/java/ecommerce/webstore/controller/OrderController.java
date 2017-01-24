package ecommerce.webstore.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecommerce.webstore.domain.Member;
import ecommerce.webstore.domain.Order;
import ecommerce.webstore.domain.OrderLine;
import ecommerce.webstore.domain.ProcessedOrderDetails;
import ecommerce.webstore.domain.Product;
import ecommerce.webstore.service.IOrderService;
import ecommerce.webstore.service.MemberService;
import ecommerce.webstore.service.ProcessedOrderDetailsService;
import ecommerce.webstore.service.ProductService;

@Controller
@SessionAttributes("currentorder")
public class OrderController {

	@Autowired
	private IOrderService orderService;

	@Autowired
	private ProcessedOrderDetailsService processedOrderDetailsService;

	@Autowired
	private ProductService productService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/addToCart/{id}", method = RequestMethod.GET)
	public @ResponseBody Collection<OrderLine> addToCart(@PathVariable("id") long id, Principal user, Model model,
			HttpSession session) {
		Member member = memberService.findByUserName(user.getName()).get(0);

		Order currentorder = (Order) session.getAttribute("currentorder");
		if (currentorder == null) {
			if (member.getOrder() == null) {
				member.setOrder(new Order());
			}
			currentorder = member.getOrder();
			session.setAttribute("currentorder", currentorder);
			System.out.println("current order is empty");
		}
		Product p = productService.findOne(id);
		if (p.getProductAvailability().equals("Out Of Stock")) {
			model.addAttribute("notAvailable", "Out Of Stock");
			return currentorder.getOrderLineList();
		}
		currentorder.addProduct(p);
		// for updating orders
		// orderService.saveOrder(currentorder);
		// .............................
		return currentorder.getOrderLineList();
	}

	@RequestMapping(value = "/removeFromCart/{id}", method = RequestMethod.GET)
	public @ResponseBody Collection<OrderLine> removeFromCart(@PathVariable("id") long id, Principal user,
			HttpSession session) {
		Member member = memberService.findByUserName(user.getName()).get(0);
		Order currentorder = (Order) session.getAttribute("currentorder");
		if (currentorder == null) {
			currentorder = member.getOrder();
			session.setAttribute("currentorder", currentorder);
		}
		Product p = productService.findOne(id);
		currentorder.removeProduct(p);
		return currentorder.getOrderLineList();
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String goToDashBoard(@ModelAttribute("processedOrder") ProcessedOrderDetails processedOrder, Principal user,
			HttpSession session, RedirectAttributes redirectAttr) {
		Member member = memberService.findByUserName(user.getName()).get(0);
		Order currentorder = (Order) session.getAttribute("currentorder");

		if (currentorder == null) {

			redirectAttr.addAttribute("cartEmpty", "No Cart Item");
			return "redirect:dashboard1";

		}
		return "checkOut";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public String checkout(@Valid @ModelAttribute("processedOrder") ProcessedOrderDetails processedOrder,
			BindingResult bindingResult, Model model, HttpSession session, SessionStatus status, Principal user,
			RedirectAttributes redirectAttr) {

		// Validations for Shipping Details

		if (bindingResult.hasErrors()) {
			System.out.println("Has error in validation");
			return "checkOut";
		}
		Member member = memberService.findByUserName(user.getName()).get(0);

		// update product quantity from database
		Order currentorder = (Order) session.getAttribute("currentorder");

		orderService.saveOrder(currentorder);
		System.out.println("orderline list" + member.getOrder().getOrderLineList().size());
		processedOrder.setOrderLineList(member.getOrder().getOrderLineList());

		// Setting member free from unprocessed orders and orderlines

		member.getOrder().setOrderLineList(null);

		// setting member's Unprocessed Order to null and processedOrder's
		// member...
		// .................................................//
		member.setOrder(null);
		processedOrder.setMember(member);
		// ............................................//

		// Lock the product and change it to Out of Stock Mode

		processedOrderDetailsService.saveProduct(processedOrder);
		for (OrderLine orderLine : processedOrder.getOrderLineList()) {

			orderLine.getProduct().setProductAvailability("Out Of Stock");
			productService.saveProduct(orderLine.getProduct());

		}

		// redirectAttr.addAttribute("name",member.getFirstName());
		redirectAttr.addFlashAttribute("processedOrder", processedOrder);
		session.removeAttribute("currentorder");
		status.setComplete();

		return "redirect:orderProcessingSuccess";
	}

	// PRG pattern to save form resubmission

	@RequestMapping("/orderProcessingSuccess")
	public String showThankYouPage() {
		return "thankyoupage";
	}

	@RequestMapping("/logout")
	public String logout(Model model, HttpServletRequest servletRequest, Principal user, HttpSession session,
			SessionStatus status) throws ServletException {
		Member member = memberService.findByUserName(user.getName()).get(0);
		Order currentorder = (Order) session.getAttribute("currentorder");
		if (currentorder == null) {
			session.removeAttribute("currentorder");
			status.setComplete();
			return "redirect:";
		}
		orderService.saveOrder(currentorder);
		session.removeAttribute("currentorder");
		status.setComplete();
		servletRequest.logout();
		return "redirect:";
	}

	@RequestMapping(value = "/trackOrder", method = RequestMethod.GET)
	public String trackOrderDetails(@RequestParam("id") long id, Model model, Principal user) {
		/*Member member = memberService.findByUserName(user.getName()).get(0);
		if ((processedOrderDetailsService.findOne(id)) == null||!user.getName().equals(processedOrderDetailsService.findOne(id).getMember().getCredentials().getUsername())
				 )

		{

			model.addAttribute("wrongOrder", "Invalid Order Id");
			return "customerdashboard";
		} else

		{*/
			model.addAttribute("processedOrder", processedOrderDetailsService.findOne(id));
			return "getOrderDetails";
		/*}*/
	}

}
