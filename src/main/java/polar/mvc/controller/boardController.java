package polar.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import polar.mvc.model.dto.BoardDTO;
import polar.mvc.model.service.BoardService;

@Controller
public class boardController {

	@Autowired
	BoardService service;
	
	//목록 조회
	@RequestMapping(value= {"/" , "/boardList"})
	public String selectAllBoard(BoardDTO boardDto , Model model) throws Exception {
		
		System.out.println("1. selectAllBoard controller 도착=====================");
		
		 List<BoardDTO> list = service.selectAllBoard();
		 
		 model.addAttribute("list", list);

		
		return "boardList";//이동할 jsp
	}
	
	//번호에 해당하는 게시글 조회
	@RequestMapping(value="/viewContent")
	public String selectOneBoard(BoardDTO boardDto , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("2. selectOneBoard controller 도착=====================");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardDTO resultDto = service.selectOneBoard(boardNo);
		
		System.out.println("2-1.번호에 해당하는 게시글 조회 결과===> "+ resultDto.getContent() +"|"+resultDto.getBoardNo()+"|"+resultDto.getTitle()+"|"+resultDto.getWriteDate());
		
		model.addAttribute("result", resultDto);
		
		return "viewForm";
	}
	
	//글쓰기 폼
	@RequestMapping(value="/writeForm")
	public String writeForm() throws Exception{
		
		return "writeForm";
	}

	//글 등록하기
	@RequestMapping(value="/write")
	public String insert(BoardDTO boardDto, Model model) throws Exception{
		
		service.insert(boardDto);
		
		return "redirect:/boardList";
	}
	
	//수정하기 폼
	@RequestMapping(value="/updateForm")
	public String updateForm(BoardDTO BoardDto , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("수정하기 폼 도착");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardDTO resultDto = service.selectOneBoard(boardNo);
		
		model.addAttribute("result", resultDto);
		
		return "updateForm";
	}
	
	//수정하기
	@RequestMapping(value="/update")
	public String  update(BoardDTO boardDto) throws Exception{
		
		service.update(boardDto);
		
		return "redirect:/boardList";
	}
	
	//삭제하기
	@RequestMapping(value="/delete")
	public String delete(String boardNo) throws Exception{
		
		service.delete(boardNo);
		
		return "redirect:/boardList";
	}
	
	
}
