package com.lms.model;
	
	/* 
	 * @author W.A.B.Abhishek
	 * IT19151502
	 * 
	 * */

	public class CommonNotice {
		private String Notice_id;
		private String title;
		private String DateTime;
		private String Notice_des;
		private String EmpId;
		private String AdminId;

		public CommonNotice() {
			
		}

		public String getNotice_id() {
			return Notice_id;
		}

		public void setNotice_id(String notice_id) {
			Notice_id = notice_id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getDateTime() {
			return DateTime;
		}

		public void setDateTime(String dateTime) {
			DateTime = dateTime;
		}

		public String getNotice_des() {
			return Notice_des;
		}

		public void setNotice_des(String notice_des) {
			Notice_des = notice_des;
		}

		public String getEmpId() {
			return EmpId;
		}

		public void setEmpId(String empId) {
			EmpId = empId;
		}

		public String getAdminId() {
			return AdminId;
		}

		public void setAdminId(String adminId) {
			AdminId = adminId;
		}

		
	}

