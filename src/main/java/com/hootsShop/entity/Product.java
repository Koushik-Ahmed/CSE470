package com.hootsShop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "category_id")
	private Integer categoryId;
	
	@Column(name = "image_path")
	private String imagePath;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "discount_rate")
	private Double discountRate;
	
	@Column(name = "seller_id")
	private Integer sellerId;
	
	@Column(name = "new_flag")
	private Integer newFlag;
	
	@Column(name = "stock")
	private Integer stock;
	
	@Column(name = "warranty_duration")
	private Integer warrantyDuration;
	
	@Column(name = "usage_duration")
	private Integer usageDuration;
	
	public Product() {
		// No-arg constructor
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return title;
	}

	public void setName(String name) {
		this.title = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(Double discountRate) {
		this.discountRate = discountRate;
	}

	public Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}

	public Integer getNewFlag() {
		return newFlag;
	}

	public void setNewFlag(Integer newFlag) {
		this.newFlag = newFlag;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getWarrantyDuration() {
		return warrantyDuration;
	}

	public void setWarrantyDuration(Integer warrantyDuration) {
		this.warrantyDuration = warrantyDuration;
	}

	public Integer getUsageDuration() {
		return usageDuration;
	}

	public void setUsageDuration(Integer usageDuration) {
		this.usageDuration = usageDuration;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + title + ", description=" + description + ", categoryId=" + categoryId
				+ ", imagePath=" + imagePath + ", price=" + price + ", discountRate=" + discountRate + ", sellerId="
				+ sellerId + ", newFlag=" + newFlag + ", stock=" + stock + ", warrantyDuration=" + warrantyDuration
				+ ", usageDuration=" + usageDuration + "]";
	}
	
}
