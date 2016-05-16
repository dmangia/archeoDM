package com.archeodm.model;

// Generated 6-mag-2016 11.48.21 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Posts generated by hbm2java
 */
@Entity
@Table(name = "posts", catalog = "platone")
public class Posts implements java.io.Serializable {

	private Integer id;
	private Users users;
	@NotEmpty
	private String title;
	@NotEmpty
	private String description;
	@NotEmpty @NotNull
	private String category;
	private String image;
	private Date created;
	private Date modified;
	private boolean status;


	public Posts() {
	}

	public Posts(Users users, String title, String description,String image, Date created,
			Date modified, boolean status) {
		this.users = users;
		this.title = title;
		this.description = description;
		this.created = created;
		this.modified = modified;
		this.status = status;
		this.image=image;
		
		
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)  //mettendo EAGER, HB caricher� anche tutti i dati del campo associato, cio� dell'utente
	@JoinColumn(name = "user_id", nullable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Column(name = "title", nullable = false)
	
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "description", nullable = false, length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created", nullable = false, length = 19)
	public Date getCreated() {
		return this.created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modified", nullable = false, length = 19)
	public Date getModified() {
		return this.modified;
	}

	public void setModified(Date modified) {
		this.modified = modified;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	@Column(name = "category", nullable = false)
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	@Column(name = "image", nullable = true)
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
	

}
