package ecommerce.webstore.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ecommerce.webstore.logging.ProductLogger;

@Aspect
@Component
public class ProductAdvice {
	@Autowired
	private ProductLogger logger;
	
	@After("execution(public * ecommerce.webstore.controller.ProductController.deleteProductRest(..))")
	public void traceDeleteMethod(JoinPoint joinpoint) {
		String method = joinpoint.getSignature().getName();
		System.out.println("**************************************");
		logger.log(method + " action has been performed for Product deletion.");
	}

}
