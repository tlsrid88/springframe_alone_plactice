package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service; 
	
	@GetMapping("/list")
	public String getList(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
		return "/board/list";
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("register");
		
		service.register(board);
		// RedirectAttributes를 파라미터로 지정합니다. 이는 등록 작업이 끝난 후 다시 목록 화면으로 이동하기 위함인데 , 추가적으로 새롭게 등록된 게시물의 번호를 같이 전달하기
		// 위해서 RedirectAttributes를 이용합니다. return시에는 redirect: 접두어를 사용하는데 이를 이용하면 스프링 MVC가 내부적으로 response.sendRedirect()를 처리해주기 때문에 편리합니다. 
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public String register() {
		return "/board/register";
	}
	
	// void 일경우는 return 할 때 mapping주소로  리턴한다. 
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		log.info("/get or modify");
		log.info("=========loginfo=========>>>>" + service.get(bno));
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify : " + board);
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..." + bno);
		
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
}
