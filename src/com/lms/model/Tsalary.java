package com.lms.model;

/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */


public  class Tsalary {
	


	private String Payment_ID;
	private String DateAndTime;
	private String Value;
	private String Rate;
	private String Teacher_ID;
	

public Tsalary() {
	
}

//Overloaded Constructor
public Tsalary(String payment_ID,String dateAndTime, String value, String rate, String teacher_ID) {
	super();
	Payment_ID=payment_ID;
	DateAndTime = dateAndTime;
	Value = value;
	Rate = rate;
	Teacher_ID = teacher_ID;
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


public String getRate() {
	return Rate;
}


public void setRate(String rate) {
	Rate = rate;
}


public String getTeacher_ID() {
	return Teacher_ID;
}


public void setTeacher_ID(String teacher_ID) {
	Teacher_ID = teacher_ID;
}















}