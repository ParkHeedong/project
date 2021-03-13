package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.park.domain.BoardVO;
import com.park.domain.Criteria;
import com.park.domain.PageDTO;
import com.park.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링의 빈으로 인식할 수 있게 함
@Log4j
@RequestMapping("/board/*") //board로 시작하는 모든 처리는 BoardController가 하도록 지정
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	//@GetMapping("/list")
	//public void list(Model model) { //나중에 게시물의 목록을 전달해라 하므로 Model을 파라미터로 지정
		
	//	log.info("list");
		
	//	model.addAttribute("list", service.getList()); //BoardServiceImpl 객체의 getList() 결과를 담아서 전달(addAttribute)
	//}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list : " + cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123)); //PageDTO를 사용할 수 있도록 Model에 담아서 화면에 전달
		
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) { //RedirectAttributes는 등록 작업이 끝난 후 다시 목록 화면으로 이동하기 위함
		
		log.info("register : " + board);
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBno()); //새롭게 등록된 게시물의 번호를 같이 전달
		
		return "redirect:/board/list";
		
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) { //자동으로 Model에 데이터를 지정한 이름으로 담아준다.
		
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno)); //BoardServiceImpl 객체의 get() 결과를 담아서 전달(addAttribute)
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify : " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
		
	}
	
	@GetMapping("/register")
	public void register()	{
		
	}
}
