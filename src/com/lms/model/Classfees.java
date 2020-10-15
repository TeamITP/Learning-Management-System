package com.lms.model;


/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */


public class Classfees {
	
	private String Payment_ID;
	private String DateAndTime;
	private String Value;
	private String Amount;
	private String Classroom_id;
	private String Student_ID;



public Classfees () {
	// TODO Auto-generated constructor stub
 }
	
	//Overloaded Constructor
	public Classfees(String payment_ID, String dateAndTime, String value, String amount, String classroom_id,
		String student_ID) {
	super();
	Payment_ID = payment_ID;
	DateAndTime = dateAndTime;
	Value = value;
	Amount = amount;
	Classroom_id = classroom_id;
	Student_ID = student_ID;
}

	
	
	//Setters and Getters
	public String getPayment_ID() {
		return Payment_ID;
	}

	public void setPayment_ID(String payment_ID) {
		Payment_ID = payment_ID;
	}

	public String getDateAndTime() {
		return DateAndTime;
	}

	public void setDateAndTime(String dateAndTime) {
		DateAndTime = dateAndTime;
	}

	public String getValue() {
		return Value;
	}

	public void setValue(String value) {
		Value = value;
	}

	public String getAmount() {
		return Amount;
	}

	public void setAmount(String amount) {
		Amount = amount;
	}

	public String getClassroom_id() {
		return Classroom_id;
	}

	public void setClassroom_id(String classroom_id) {
		Classroom_id = classroom_id;
	}

	public String getStudent_ID() {
		return Student_ID;
	}

	public void setStudent_ID(String student_ID) {
		Student_ID = student_ID;
	}



	








}