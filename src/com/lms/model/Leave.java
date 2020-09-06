package com.lms.model;

/*Anuththara K.G.S.N*/
/*IT19142692*/

public class Leave {
	private String Leave_ID;
	private String Status;
	private String Reason;
	private String Date;
	private String Emp_ID;
	
	public Leave(String leave_ID, String status, String reason, String date, String emp_ID) {
		super();
		Leave_ID = leave_ID;
		Status = status;
		Reason = reason;
		Date = date;
		Emp_ID = emp_ID;
	}

	public String getLeave_ID() {
		return Leave_ID;
	}

	public void setLeave_ID(String leave_ID) {
		Leave_ID = leave_ID;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getReason() {
		return Reason;
	}

	public void setReason(String reason) {
		Reason = reason;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public String getEmp_ID() {
		return Emp_ID;
	}

	public void setEmp_ID(String emp_ID) {
		Emp_ID = emp_ID;
	}
	
	
	
}
