package com.lms.service;
import java.util.logging.Logger;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */

public interface UserService {
	//Initializing logger
	public static final Logger logger = Logger.getLogger(UserService.class.getName());
	
	/**
	 * Login
	 * 
	 * @param userID, password
	 */
	public int validate(String userId, String password);
	
	public int accountVerification(String userId);
	
	public int verificationCode(String code, String userId);
	
	public int updatePassword(String userId, String pw);
}
