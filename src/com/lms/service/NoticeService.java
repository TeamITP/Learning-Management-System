package com.lms.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.lms.model.CommonNotice;

public interface NoticeService {
	// Initializing logger
		public static final Logger logger = Logger.getLogger(UserService.class.getName());
		
		
		
	public int insertNotice(CommonNotice commonNotice);
	
	
	public ArrayList<CommonNotice> getNotice(String empid);
}
