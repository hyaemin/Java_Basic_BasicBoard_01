package polar.mvc.model.service;

import java.util.List;

import polar.mvc.model.dto.BoardDTO;

public interface BoardService{

	 List<BoardDTO> selectAllBoard() throws Exception;
		
	 BoardDTO selectOneBoard(int boardNo) throws Exception;
	
	 void insert(BoardDTO boardDto) throws Exception;
	
	 void delete(String boardNo) throws Exception;
	
	 void update(BoardDTO boardDto) throws Exception;
}
