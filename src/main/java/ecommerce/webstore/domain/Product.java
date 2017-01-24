package ecommerce.webstore.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Product implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private long id;
	@NotEmpty
	private String name;
	//private String qty;
	@NotNull 
	private double price;
	public String getProductAvailability() {
		return productAvailability;
	}

	public void setProductAvailability(String productAvailability) {
		this.productAvailability = productAvailability;
	}

	@Enumerated
	private Category category;
	private String productAvailability="Pending";

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JsonIgnore
	private Member farmer;
	
	@Transient
	private MultipartFile image;
	
	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}


	public Member getFarmer() {
		return farmer;
	}

	public void setFarmer(Member farmer) {
		this.farmer = farmer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/*public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}*/

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		else if (!(obj instanceof Product))
			return false;
		Product product = (Product) obj;
		return product.id == id;

	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = Category.FRUIT;
	}

}
