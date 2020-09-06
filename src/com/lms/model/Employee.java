package com.lms.model;

/*Anuththara K.G.S.N*/
/*IT19142692*/

public class Employee {	
	private String Emp_ID;
	private String Name;
	private String Password;
	private String Address;
	private String Phone;
	private String NIC;
	
	public Employee() {}
	
	public Employee(String emp_ID, String name, String password, String address, String phone, String nIC) {
		super();
		Emp_ID = emp_ID;
		Name = name;
		Password = password;
		Address = address;
		Phone = phone;
		NIC = nIC;
	}

	public String getEmp_ID() {
		return Emp_ID;
	}

	public void setEmp_ID(String emp_ID) {
		Emp_ID = emp_ID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getNIC() {
		return NIC;
	}

	public void setNIC(String nIC) {
		NIC = nIC;
	}
	
	
	
}
