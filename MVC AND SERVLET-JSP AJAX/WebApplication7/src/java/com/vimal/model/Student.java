package com.vimal.model;

public class Student {
	public Student() {
		
	}

	public Student(Integer id, String name, String email, String contact,
			Integer marks) {

		this.id = id;
		this.name = name;
		this.email = email;
		this.contact = contact;
		this.marks = marks;
	}

	public Student(String name, String email, String contact, Integer marks) {
		super();
		this.name = name;
		this.email = email;
		this.contact = contact;
		this.marks = marks;
	}

	private Integer id;
	private String name;
	private String email;
	private String contact;
	private Integer marks;

	public Integer getMarks() {
		return marks;
	}

	public void setMarks(Integer marks) {
		this.marks = marks;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", email=" + email
				+ ", contact=" + contact + ", marks=" + marks + "]";
	}

}
