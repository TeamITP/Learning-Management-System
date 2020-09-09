package com.lms.model;

public class Assignment {
	
		protected String A_ID;
	    protected String Date;
	    protected String Question;
	    
	    
	    public Assignment() {}

	    public Assignment( String Date, String Class_ID, String Question) {
	        super();
	        this.Date = Date;
	        
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
	    public void setA_Id(String A_ID) {
	        this.A_ID = A_ID;
	    }
	    public String getDate() {
	        return Date;
	    }
	    public void setDate(String Date) {
	        this.Date = Date;
	    }
	  
	    public String getQuestion() {
	        return Question;
	    }
	    public void setQuestion(String Question) {
	        this.Question =Question;
	    }
}
