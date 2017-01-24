package ecommerce.webstore.controller;

import java.security.Principal;
import java.io.File;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import javax.servlet.ServletContext;
import org.springframework.web.multipart.MultipartFile;

import ecommerce.webstore.domain.Member;
import ecommerce.webstore.domain.Product;
import ecommerce.webstore.service.MemberService;
import ecommerce.webstore.service.ProductService;

import org.springframework.validation.BindingResult;
import javax.validation.Valid;

@Controller
public class ProductController {
	@Autowired
	ServletContext servletContext;
	@Autowired
	ProductService productService;
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String createProductForm(@ModelAttribute("product") Product product, Model model) {
		model.addAttribute("content", "create_product");
		return "admin_base_template";
	}

	@RequestMapping(value="/product", method=RequestMethod.POST )
	public String createProduct(Principal user,Model model,@Valid Product product,BindingResult bindingResult) {
		
		if(bindingResult.hasErrors())
		{
			model.addAttribute("content", "create_product");
			return "admin_base_template";
		}
		Member farmer=memberService.findByUserName(user.getName()).get(0);
		product.setFarmer(farmer);
		String rootDirectory = servletContext.getRealPath("/");
		productService.saveProduct(product);
		
		MultipartFile productImage = product.getImage();
	
		System.out.println(productImage.isEmpty());
		try {
			productImage.transferTo(new File(rootDirectory+"\\images\\"+ product.getId() + ".jpg"));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:productlist";
	}

	@RequestMapping(value="/product/edit/{productId}", method=RequestMethod.GET )
	public String editProductForm(Model model,@PathVariable("productId") long productId) {
		model.addAttribute("product",productService.findOne(productId));
		model.addAttribute("content", "edit_product");
		return "admin_base_template";
	}

	@RequestMapping(value="/product/edit", method=RequestMethod.POST )
	public String editProduct(Principal user,@ModelAttribute("product") Product product) {
		productService.saveProduct(product);
		return "redirect:/productlist";
	}

	@RequestMapping(value="/productlist", method=RequestMethod.GET )
	public String listProduct(Model model,Product product) {
		model.addAttribute("products", productService.findAllProducts());
		model.addAttribute("content", "list_product");
		return "admin_base_template";
	}

	@RequestMapping(value="/delete_product_r/{productId}", method=RequestMethod.DELETE)
	@ResponseStatus(value=HttpStatus.OK)
	public void deleteProductRest(@PathVariable("productId") long productId)
	{
		productService.delete(productId);
		System.out.println(productId+"After product delete fail");
	}
	
	@RequestMapping(value="/productdashbaord", method=RequestMethod.GET )
	public String createProductForm(Model model,Product product) {
		model.addAttribute("content", "create_product");
		model.addAttribute("products", productService.findAllProducts());
		return "customerdashboard";
	}
	
	@RequestMapping(value="/product/detail_r/{productId}", method=RequestMethod.GET )
	public @ResponseBody Product productDetail(@PathVariable("productId") long productId) {
		Product product = productService.findOne(productId);
		return product;
	}
}
