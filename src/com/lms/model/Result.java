package com.lms.model;

/**
 * Imbulana Liyanage D.S.I.
 * IT19134772
 */

public class Result {
	private String Result_id;
	private String Classroom_id;
	private String Type;
	private String Description;

	public Result(String result_id, String classroom_id, String type, String description) {
		super();
		Result_id = result_id;
		Classroom_id = classroom_id;
		Type = type;
		Description = description;
	}

	public Result() {
		// TODO Auto-generated constructor stub
	}

	public String getResult_id() {
		return Result_id;
	}

	public String getClassroom_id() {
		return Classroom_id;
	}

	public String getType() {
		return Type;
	}

	public String getDescription() {
		return Description;
	}

	public void setResult_id(String result_id) {
		Result_id = result_id;
	}

	public void setClassroom_id(String classroom_id) {
		Classroom_id = classroom_id;
	}

	public void setType(String type) {
		Type = type;
	}

	public void setDescription(String description) {
		Description = description;
	}
	
	
}
