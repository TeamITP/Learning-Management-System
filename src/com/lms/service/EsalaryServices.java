package com.lms.service;

/* @author Pussadeniya PMSSB
* IT19218618
* 
* */

import java.util.logging.Logger;

import com.lms.model.Assignment;
import com.lms.model.Classfees;
import com.lms.model.Classroom;
import com.lms.model.Employee;
import com.lms.model.Tsalary;
import com.lms.model.Esalary;
import com.lms.util.ConnectDB;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.Row;

import java.awt.Color;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.lms.model.Esalary;

public interface EsalaryServices {
	
	// Initializing logger
			public static final Logger logger = Logger.getLogger(UserService.class.getName());
			

	int insertEsalary(Esalary esalary);

	ArrayList<Esalary> getEsalaryList();

	Esalary getEsalary(String Payment_ID);

}
