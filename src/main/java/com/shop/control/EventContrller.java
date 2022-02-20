package com.shop.control;

import java.util.List;
import java.util.Locale;

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

import com.shop.dto.EventDTO;
import com.shop.service.EventService;
import com.shop.vo.PageMaker;

@Controller
@RequestMapping("/")
public class EventContrller {
	@Inject
	private EventService es;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/eventgesipan/eventmain", method = RequestMethod.GET)
	public String list(PageMaker pm,Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		model.addAttribute("list",es.EventlistSearchCriteria(pm));
		pm.setTotalCount(es.EventlistSearchCount(pm));
		
		if(session.getAttribute("id") != null) {
			String id = (String)session.getAttribute("id");
			String authority = (String) session.getAttribute("authority");
			
			if(authority.equals("1")) {
				System.out.println("관리자");
				
				return "/eventgesipan/eventmainA";
			}else {
				System.out.println("사용자");
			}
			System.out.println("session : "+session);
			System.out.println("id = "+id +", autho = "+authority);
		}

		return "/eventgesipan/eventmain";

	}
	
	
	
	@RequestMapping(value = "/eventgesipan/eventwrite", method = RequestMethod.GET)
	public void writeGet() throws Exception {
		//return "/sboard/write
	
	}
	@RequestMapping(value = "/eventgesipan/eventwrite", method = RequestMethod.POST)
	public String writePost(EventDTO event,RedirectAttributes rttr) throws Exception {
		es.write(event);
		//rttr.addAttribute("msg","success");
		rttr.addFlashAttribute("msg","success");
		return "redirect:/eventgesipan/eventmain";		
	}
	
	@RequestMapping(value = "/eventgesipan/eventread", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,PageMaker pm,Model model) throws Exception {
		System.out.println(pm);
		es.viewcount(bno);
		model.addAttribute("eventDTO",es.read(bno));
		System.out.println(es.read(bno));	
	}
	
	@RequestMapping(value = "/eventgesipan/eventreadA", method = RequestMethod.GET)
	public void readA(@RequestParam("bno") int bno,PageMaker pm,Model model) throws Exception {
		System.out.println(pm);
		model.addAttribute("eventDTO",es.read(bno));
		System.out.println(es.read(bno));

		
	}
	
	@RequestMapping(value = "/eventgesipan/eventremove", method = RequestMethod.GET)
	public String remove(@RequestParam("bno") int bno,PageMaker pm,Model model,RedirectAttributes rttr) throws Exception {
		System.out.println(bno);
		es.remove(bno);
		rttr.addAttribute("page", pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("searchType", pm.getSearchType());
		rttr.addAttribute("keyword", pm.getKeyword());
		rttr.addFlashAttribute("msg","success");
		return "redirect:/eventgesipan/eventmain";	
	}
	
	
	@RequestMapping(value = "/eventgesipan/eventmodify", method = RequestMethod.GET)
	public void modifyGet(@RequestParam("bno") int bno,PageMaker pm,Model model) throws Exception {
		System.out.println(pm);
		model.addAttribute(es.read(bno));
	}


	@RequestMapping(value = "/eventgesipan/eventmodify", method = RequestMethod.POST)
	public String modifyPost(EventDTO board,PageMaker pm,Model model,RedirectAttributes rttr) throws Exception {
		es.modify(board);
		System.out.println(pm);
		
		rttr.addAttribute("page", pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("searchType", pm.getSearchType());
		rttr.addAttribute("keyword", pm.getKeyword());

		rttr.addFlashAttribute("msg","success");
		return "redirect:/eventgesipan/eventmain";	
	}

	
}









