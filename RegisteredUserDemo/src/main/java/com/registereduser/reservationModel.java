package com.registereduser;

import java.sql.Date;

public class reservationModel {
	
	private int id;
	private String customer_name;
	private String phone;
	private int no_of_guests;
	private java.sql.Date date;
	private String room_type;
	private String payment_method;
	
	public reservationModel(int id, String customer_name, String phone, int no_of_guests, Date date, String room_type,
			String payment_method) {
		super();
		this.id = id;
		this.customer_name = customer_name;
		this.phone = phone;
		this.no_of_guests = no_of_guests;
		this.date = date;
		this.room_type = room_type;
		this.payment_method = payment_method;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getNo_of_guests() {
		return no_of_guests;
	}

	public void setNo_of_guests(int no_of_guests) {
		this.no_of_guests = no_of_guests;
	}

	public java.sql.Date getDate() {
		return date;
	}

	public void setDate(java.sql.Date date) {
		this.date = date;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
		
}
