package com.lms.model;

public class Assignment {
	
		private String A_ID;
	    private String Date;
	    private String Class_ID;
	    private String Question;
	    
	    
	    public Assignment() {}

	    public Assignment( String Date, String Class_ID, String Question) {
	        super();
	        this.Date = Date;
	        this.Class_ID =Class_ID;
	        this.Question = Question;
	    }
	    
	    
	    public Assignment(String A_ID, String Date, String Class_ID, String Question) {
	        super();
	        this.A_ID = A_ID;
	        this.Date= Date;
	        this.Question = Question;
	    }

		public String getA_ID() {
			return A_ID;
		}

		public void setA_ID(String a_ID) {
			A_ID = a_ID;
		}

		public String getDate() {
			return Date;
		}

		public void setDate(String date) {
			Date = date;
		}

		public String getClass_ID() {
			return Class_ID;
		}

		public void setClass_ID(String class_ID) {
			Class_ID = class_ID;
		}

		public String getQuestion() {
			return Question;
		}

		public void setQuestion(String question) {
			Question = question;
		}

	   
}
