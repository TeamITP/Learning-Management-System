package com.lms.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.lms.model.Classroom;
import com.lms.model.CommonNotice;

public interface NoticeService {
	// Initializing logger
		public static final Logger logger = Logger.getLogger(UserService.class.getName());
		
		
		
	public int insertNotice(CommonNotice commonNotice);
	
	
	public ArrayList<CommonNotice> getNotice(String empid);
	
	public int updateNotice(CommonNotice commonnotice);
	
	public CommonNotice getNoticeById(String noticeId);
	
	public int DeleteNotices(String Notice_id);
	
	public String generateReport(String Notice_id, String root);
	
}
