package com.shop.control;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.dto.MemberDTO;
import com.shop.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class LoginController {
	@Autowired
	private MemberService service;

	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		return "/login/login";
	}
	@RequestMapping(value = "/login/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/login/login";
	}
	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public String selectLogin(@Param("id") String id,@Param("pw") String pw,Model model, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
//		rttr.addAttribute("id", memberdto.getId());
//		rttr.addAttribute("pw", memberdto.getPw());
		HttpSession session = request.getSession();

			MemberDTO m = service.selectLogin(id,pw);
			
			if(m != null) {
				session.setAttribute("id", m.getId());
				session.setAttribute("authority", m.getAuthority());
				System.out.println(m.getId()+m.getPw());
				System.out.println(m.getAuthority());
			}else {
				rttr.addFlashAttribute("msg","fail");
				session.invalidate();
				return "redirect:/login/login";
			}
			
		
		rttr.addFlashAttribute("msg","success");
		System.out.println(session.getAttribute("id"));
		return "redirect:/";
	}
	
}
