package com.eileenchoi.main.soloproject.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="drinks")
public class Drink {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="MM-dd-yyyy")
	private Date createdAt;
	@DateTimeFormat(pattern="MM-dd-yyyy")
	private Date updatedAt;   
	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
	@NotBlank(message="*Required field.")
	@Size(min=3,max=30,message="Please add a name of at least 3 characters.")
	public String drinkName;
	
	@NotBlank(message="*Required field.")
	@Size(min=3,max=255,message="Please add a description of at least 3 characters.")
	public String description;
	
	@NotBlank(message="*Required field.")
	@Size(min=3,max=30,message="Must be at least 3 characters.")
	public String tea;
	
	@NotBlank(message="*Required field.")
	@Size(min=3,max=30,message="Must be at least 3 characters.")
	public String topping;
	
	@NotBlank(message="*Required field.")
	@Size(min=3,max=30,message="Must be at least 3 characters.")
	public String dairy;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;

	public Drink() {}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	public Date getUpdatedAt() {
		return updatedAt;
	}
	
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	public String getDrinkName() {
		return drinkName;
	}
	
	public void setDrinkName(String drinkName) {
		this.drinkName = drinkName;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getTea() {
		return tea;
	}
	
	public void setTea(String tea) {
		this.tea = tea;
	}
	
	public String getTopping() {
		return topping;
	}
	
	public void setTopping(String topping) {
		this.topping = topping;
	}
	
	public String getDairy() {
		return dairy;
	}
	
	public void setDairy(String dairy) {
		this.dairy = dairy;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	
	
	
}
