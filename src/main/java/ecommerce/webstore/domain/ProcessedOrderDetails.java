package ecommerce.webstore.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;

import org.springframework.format.annotation.DateTimeFormat;
@Entity
public class ProcessedOrderDetails {
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Address getBillingDetails() {
		return billingDetails;
	}

	public void setBillingDetails(Address billingDetails) {
		this.billingDetails = billingDetails;
	}

	public Address getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(Address shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	@Id
	@GeneratedValue
	private long id;

	@Valid
	@OneToOne(cascade = CascadeType.PERSIST)
	private Address billingDetails;

	@Valid
	@OneToOne(cascade = CascadeType.PERSIST)
	private Address shippingAddress;
	
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	@Temporal(TemporalType.DATE)
	
	//Each processed order has member Id
	
	@Valid
	@OneToOne(cascade = CascadeType.PERSIST)
	private Member member;
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	//private Date shippingDate= null;
	private Date ordereddate= new Date();
	private Date shippingDate= null;
	
	public Date getOrdereddate() {
		return ordereddate;
	}

	public void setOrdereddate(Date ordereddate) {
		this.ordereddate = ordereddate;
	}

	@OneToMany(cascade = CascadeType.ALL)
	private List<OrderLine> orderLineList = null;
	
	private String orderStatus="PENDING";

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public List<OrderLine> getOrderLineList() {
		return orderLineList;
	}

	public void setOrderLineList(List<OrderLine> orderLineList) {
		this.orderLineList = orderLineList;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCreditCardNumber() {
		return creditCardNumber;
	}

	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}

	private String phoneNumber;

	
//	@CreditCardNumber
	private String creditCardNumber;


	public Date getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}

}
