package polar.mvc.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import polar.mvc.model.dao.BoardDAO;
import polar.mvc.model.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardDTO> selectAllBoard() throws Exception {
		
		return boardDAO.selectAllBoard();
	}

	@Override
	public BoardDTO selectOneBoard(int boardNo) throws Exception {
		
		return boardDAO.selectOneBoard(boardNo);
	}

	@Override
	public void insert(BoardDTO boardDto) throws Exception {
		boardDAO.insert(boardDto);
	}

	@Override
	public void delete(String boardNo) throws Exception {
		boardDAO.delete(boardNo);

	}

	@Override
	public void update(BoardDTO boardDto) throws Exception {
		boardDAO.update(boardDto);

	}

}
