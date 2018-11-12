package polar.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import polar.mvc.model.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> selectAllBoard() throws Exception{
		
		return sqlSession.selectList("boardMapper.selectAllBoard");
	}

	@Override
	public BoardDTO selectOneBoard(int boardNo) throws Exception {
		
		return sqlSession.selectOne("boardMapper.selectOneBoard" , boardNo);
	}

	@Override
	public void insert(BoardDTO boardDto) throws Exception {
		sqlSession.insert("boardMapper.insertBoard", boardDto);
	}

	@Override
	public void delete(String boardNo) throws Exception {
		
		sqlSession.delete("boardMapper.deleteBoard", boardNo);

	}

	@Override
	public void update(BoardDTO boardDto) throws Exception {
		sqlSession.update("boardMapper.updateBoard" , boardDto);

	}

}
