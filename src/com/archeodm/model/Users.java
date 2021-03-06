package com.archeodm.model;

// Generated 6-mag-2016 11.48.21 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Users generated by hbm2java
 */
@Entity
@Table(name = "users", catalog = "platone")
public class Users implements java.io.Serializable {

	private String username;
	private String password;
	private String nome;
	private String cognome;
	private String indirizzo;
	private String email;
	
	private byte enabled;
	private Set<UserRoles> userRoleses = new HashSet<UserRoles>(0);
	private Set<Posts> postses = new HashSet<Posts>(0);

	public Users() {
	}

	public Users(String username, String password, byte enabled,String nome, String cognome, String indirizzo,String email) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.nome=nome;
		this.cognome=cognome;
		this.indirizzo=indirizzo;
		this.email=email;
	}

	public Users(String username, String password, byte enabled,
			Set<UserRoles> userRoleses, Set<Posts> postses) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.userRoleses = userRoleses;
		this.postses = postses;
	}

	@Id
	@Column(name = "username", unique = true, nullable = false, length = 45)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 45)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "enabled", nullable = false)
	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users")
	public Set<UserRoles> getUserRoleses() {
		return this.userRoleses;
	}

	public void setUserRoleses(Set<UserRoles> userRoleses) {
		this.userRoleses = userRoleses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users")
	public Set<Posts> getPostses() {
		return this.postses;
	}

	public void setPostses(Set<Posts> postses) {
		this.postses = postses;
	}
	@Column(name = "nome", nullable = true)
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	@Column(name = "cognome", nullable = true)
	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	@Column(name = "indirizzo", nullable = true)
	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	@Column(name = "email", nullable = true)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
