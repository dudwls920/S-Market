package com.shop.control;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.dto.MemberDTO;
import com.shop.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/*")
public class SignUpController {
	@Autowired
	private MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(SignUpController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/login/signUp", method = RequestMethod.GET)
	public String insert() {
		return "/login/signUp";
	}
	@RequestMapping(value = "/login/signUp", method = RequestMethod.POST)
	public String insertDB(MemberDTO dto) throws Exception {
		int result=service.idChk(dto); 
		try {
			if(result == 1) {
				return"/login/signUp";
			}else {
				service.insert(dto);
			}
		}catch (Exception e) {
			throw new RuntimeException();
		}
		
		return "redirect:/login/login";
	}
	@ResponseBody
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public int idChk(MemberDTO dto) throws Exception{
		logger.info("member register : ");
		int result=service.idChk(dto);
		return result;
	}
	
}
