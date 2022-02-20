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

import com.shop.dto.UserGesipanDTO;
import com.shop.dto.ReplyDTO;
import com.shop.service.EventService;
import com.shop.service.UserGesipanService;
import com.shop.vo.PageMaker;

@Controller
@RequestMapping("/")
public class UserGesipanContrller {
	@Inject
	
	  private UserGesipanService es;
	


	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/usergesipan/usergesipanmain", method = RequestMethod.GET)
	public void list(PageMaker pm,Model model) throws Exception {
		
		logger.info("listPage");
		System.out.println(pm);
		//PageMaker [page=2, perPageNum=10, searchType=t, keyword=888, totalCount=0, startPage=0, endPage=0, prev=false, next=false]
		model.addAttribute("list",es.UserGesipanlistSearchCriteria(pm));
		pm.setTotalCount(es.UserGesipanlistSearchCount(pm));
		//model.addAttribute("pageMaker",pm);
		//return "sboard/list";
		

	}
	
	
	
	@RequestMapping(value = "/usergesipan/usergesipanwrite", method = RequestMethod.GET)
	public void writeGet() throws Exception {
		
		//return "/sboard/write

	
	}
	@RequestMapping(value = "/usergesipan/usergesipanwrite", method = RequestMethod.POST)
	public String writePost(UserGesipanDTO usergesipan,RedirectAttributes rttr) throws Exception {
		es.write(usergesipan);

		//rttr.addAttribute("msg","success");
		rttr.addFlashAttribute("msg","success");
		return "redirect:/usergesipan/usergesipanmain";		
	}
	
	@RequestMapping(value = "/usergesipan/usergesipanread", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,Model model) throws Exception {
		es.viewcount(bno);
		model.addAttribute(es.read(bno));
		System.out.println(es.read(bno)+"테스트");
		model.addAttribute("replyList",es.readReply(bno));
		
	}
	
	@RequestMapping(value = "/usergesipan/usergesipanreadRemove", method = RequestMethod.GET)
	public String replyRemove(@RequestParam("rno") int rno,@RequestParam("bno") int bno,PageMaker pm,RedirectAttributes rttr) throws Exception {
		System.out.println("확인"+bno+rno);
		es.replyRemove(bno,rno);
		rttr.addAttribute("bno",bno);
		return "redirect:/usergesipan/usergesipanread";	
	}
	@RequestMapping(value = "/usergesipan/usergesipanreadModify", method = RequestMethod.GET)
	public String replyModify(ReplyDTO dto,RedirectAttributes rttr) throws Exception {
		System.out.println("확인"+dto.getBno());
		es.replyModify(dto);
		System.out.println(dto);
		rttr.addAttribute("bno",dto.getBno());
		return "redirect:/usergesipan/usergesipanread";	
	}
	// http://localhost:8081/control/usergesipan/usergesipanread?page=1&perPageNum=9&searchType&keyword&bno=2
	@RequestMapping(value = "/usergesipan/usergesipanread", method = RequestMethod.POST)
	
	public String readReply(ReplyDTO reply,RedirectAttributes rttr) throws Exception {
		System.out.println("확인하기"+reply);
		es.writeRe(reply);
		
		rttr.addFlashAttribute("msg","success");
		rttr.addAttribute("bno",reply.getBno());
		
		return "redirect:/usergesipan/usergesipanread";	
	}
	
	@RequestMapping(value = "/usergesipan/usergesipanremove", method = RequestMethod.GET)
	public String remove(@RequestParam("bno") int bno,Model model,RedirectAttributes rttr) throws Exception {
		es.remove(bno);

		rttr.addFlashAttribute("msg","success");
		return "redirect:/usergesipan/usergesipanmain";	
	}
	
	@RequestMapping(value = "/usergesipan/usergesipanmodify", method = RequestMethod.GET)
	public void modifyGet(@RequestParam("bno") int bno,Model model) throws Exception {
		model.addAttribute(es.read(bno));
	}


	@RequestMapping(value = "/usergesipan/usergesipanmodify", method = RequestMethod.POST)
	public String modifyPost(UserGesipanDTO board,Model model,RedirectAttributes rttr) throws Exception {
		es.modify(board);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/usergesipan/usergesipanmain";	
	}

	
}









