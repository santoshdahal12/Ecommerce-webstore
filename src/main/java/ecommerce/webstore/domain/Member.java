/**
 * 
 */
package ecommerce.webstore.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
/*import javax.persistence.Transient;*/
import javax.validation.Valid;

import org.hibernate.validator.constraints.NotEmpty;
/*import org.springframework.web.multipart.MultipartFile;*/
import org.springframework.web.multipart.MultipartFile;

/**
 * @author santosh dahal
 *
 */
@Entity
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	public void setId(Long id) {
		this.id = id;
	}

	@OneToOne(cascade = CascadeType.PERSIST)
	@Valid
	private Order order;
	
	public Member() {
		order = new Order();
		order.setMember(this);
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@NotEmpty
	@Column(name = "title")
	private String title;

	@NotEmpty
	@Column(name = "firstName")
	private String firstName;

	@Column(name = "middleName")
	private String middleName;
	@NotEmpty
	@Column(name = "lastName")
	private String lastName;
	@NotEmpty

	@Column(name = "email")
	private String email;

	@Column(name = "dateOfMembership")
	private Date dateOfMembership = new Date();

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@NotEmpty
	@Column(name = "Phone")
	private String phone;

	public Long getId() {
		return id;
	}

	@Valid
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id")
	private Address memberAddress;

	@Valid
	@OneToOne(cascade = { CascadeType.MERGE, CascadeType.REMOVE })
	@JoinColumn(name = "USERNAME")
	private Credentials credentials;

	// For Image binding..late version of project

	@Transient
	private MultipartFile image;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDateOfMembership() {
		return dateOfMembership;
	}

	public void setDateOfMembership(Date dateOfMembership) {
		this.dateOfMembership = dateOfMembership;
	}

	public Address getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(Address memberAddress) {
		this.memberAddress = memberAddress;
	}

	public Credentials getCredentials() {
		return credentials;
	}

	public void setCredentials(Credentials credentials) {
		this.credentials = credentials;

	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

}
