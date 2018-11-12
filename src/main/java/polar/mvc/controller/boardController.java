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
	
	//��� ��ȸ
	@RequestMapping(value= {"/" , "/boardList"})
	public String selectAllBoard(BoardDTO boardDto , Model model) throws Exception {
		
		System.out.println("1. selectAllBoard controller ����=====================");
		
		 List<BoardDTO> list = service.selectAllBoard();
		 
		 model.addAttribute("list", list);

		
		return "boardList";//�̵��� jsp
	}
	
	//��ȣ�� �ش��ϴ� �Խñ� ��ȸ
	@RequestMapping(value="/viewContent")
	public String selectOneBoard(BoardDTO boardDto , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("2. selectOneBoard controller ����=====================");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardDTO resultDto = service.selectOneBoard(boardNo);
		
		System.out.println("2-1.��ȣ�� �ش��ϴ� �Խñ� ��ȸ ���===> "+ resultDto.getContent() +"|"+resultDto.getBoardNo()+"|"+resultDto.getTitle()+"|"+resultDto.getWriteDate());
		
		model.addAttribute("result", resultDto);
		
		return "viewForm";
	}
	
	//�۾��� ��
	@RequestMapping(value="/writeForm")
	public String writeForm() throws Exception{
		
		return "writeForm";
	}

	//�� ����ϱ�
	@RequestMapping(value="/write")
	public String insert(BoardDTO boardDto, Model model) throws Exception{
		
		service.insert(boardDto);
		
		return "redirect:/boardList";
	}
	
	//�����ϱ� ��
	@RequestMapping(value="/updateForm")
	public String updateForm(BoardDTO BoardDto , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("�����ϱ� �� ����");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardDTO resultDto = service.selectOneBoard(boardNo);
		
		model.addAttribute("result", resultDto);
		
		return "updateForm";
	}
	
	//�����ϱ�
	@RequestMapping(value="/update")
	public String  update(BoardDTO boardDto) throws Exception{
		
		service.update(boardDto);
		
		return "redirect:/boardList";
	}
	
	//�����ϱ�
	@RequestMapping(value="/delete")
	public String delete(String boardNo) throws Exception{
		
		service.delete(boardNo);
		
		return "redirect:/boardList";
	}
	
	
}
