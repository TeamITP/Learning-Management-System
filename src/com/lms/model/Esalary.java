package com.lms.model;

/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */


public class Esalary {
	
	
	private String Payment_ID;
	private String Emp_ID;
	private String Contract;


	
	
	public String getPayment_ID() {
		return Payment_ID;
	}



	public void setPayment_ID(String payment_ID) {
		Payment_ID = payment_ID;
	}



	public String getEmp_ID() {
		return Emp_ID;
	}



	public void setEmp_ID(String emp_ID) {
		Emp_ID = emp_ID;
	}



	public String getContract() {
		return Contract;
	}



	public void setContract(String contract) {
		Contract = contract;
	}



	


public  Esalary () {
	
	
}



public Esalary(String payment_ID, String emp_ID, String contract) {
	super();
	Payment_ID = payment_ID;
	Emp_ID = emp_ID;
	Contract = contract;
}



















}
