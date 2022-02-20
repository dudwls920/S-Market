package com.shop.control;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.dto.MemberDTO;
import com.shop.service.MemberService;
import com.shop.service.OrderService;
import com.shop.service.UserGesipanService;
import com.shop.vo.PageMaker;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Inject
	private OrderService orderService;
	@Inject
	private UserGesipanService userService;
	@Inject
	private MemberService memberService;
	
	HttpServletRequest request;
	String id;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/mypage1", method = RequestMethod.GET)
	public String myPage1(Model model, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		id = (String)session.getAttribute("id");
		if(id == null) {
			rttr.addFlashAttribute("msg","nolog");
			return "redirect:/login/login"; 
		}
		model.addAttribute("orderList", orderService.orderList(id));
		return "/mypage/mypage1";
	}
	
	@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
	public String myPage2(PageMaker pm,Model model, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		id = (String)session.getAttribute("id");
		if(id == null) {
			rttr.addFlashAttribute("msg","nolog");
			return "redirect:/login/login"; 
		}
		pm.setTotalCount(orderService.mypostCount(id));
		model.addAttribute("mypost", orderService.mypostList(pm,id));
		
		
		return "/mypage/mypage2";
		  
	}
	@RequestMapping(value = "/mypage3", method = RequestMethod.GET)
	public String myPage3get(MemberDTO dto,Model model,RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		id=(String)session.getAttribute("id");
		model.addAttribute("memberDTO",memberService.checkId(id));
		if(id == null) {
			rttr.addFlashAttribute("msg","nolog");
			return "redirect:/login/login"; 
		}
		return "/mypage/mypage3";
	}
	
	@RequestMapping(value = "/mypage3", method = RequestMethod.POST)
	public String myPage3post(MemberDTO dto,Model model,RedirectAttributes rttr) throws Exception {
		memberService.update(dto);

		return "/mypage/mypage1";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String myPage1(@RequestParam(value = "ordernum") String ordernum ,Model model, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		id = (String)session.getAttribute("id");
		if(id == null) {
			rttr.addFlashAttribute("msg","nolog");
			return "redirect:/login/login"; 
		}
		orderService.remove(ordernum);
		model.addAttribute("orderList", orderService.orderList(id));
				
		return "/mypage/mypage1";
	}
	@RequestMapping(value = "/mypage4", method = RequestMethod.GET)
	public String myPage4get(MemberDTO dto,Model model,RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		id=(String)session.getAttribute("id");
		model.addAttribute("memberDTO",memberService.checkId(id));
		if(id == null) {
			rttr.addFlashAttribute("msg","nolog");
			return "redirect:/login/login"; 
		}
		return "/mypage/mypage4";
	}
	
	@RequestMapping(value = "/mypage4", method = RequestMethod.POST)
	public String myPage4post(MemberDTO dto,Model model,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		id=(String)session.getAttribute("id");
		if(id.equals(dto.getId())) {
			memberService.delete(dto.getId());
			session.invalidate();
		}else {
			return "redirect:/mypage/mypage4";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/cash", method = RequestMethod.GET)
	public String cash(@RequestParam(value = "ordernum") String ordernum,Model model,RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		id=(String)session.getAttribute("id");
		
		if(id == null) {
			rttr.addFlashAttribute("msg","nolog");
			return "redirect:/login/login"; 
		}
		
		model.addAttribute("memberDTO",memberService.checkId(id));
		model.addAttribute("cashOrderList", orderService.cashOrderList(ordernum));
		return "/cash";
	}
	
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String pay(@RequestParam(value = "ordernum") String ordernum,RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		id=(String)session.getAttribute("id");
		
		if(id == null) {
			rttr.addFlashAttribute("msg","nolog");
			return "redirect:/login/login"; 
		}
		orderService.update(ordernum);

		return "redirect:/mypage/mypage1";
	}
	
	
}
