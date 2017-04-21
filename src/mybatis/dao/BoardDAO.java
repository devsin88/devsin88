package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.BoardVO;
import mybatis.vo.CommentVO;

public class BoardDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int getCount(int sub_no){
		return template.selectOne("board.count", sub_no);
	}
	
	public BoardVO[] getBoard(Map<String, Integer> map){
		List<BoardVO> list = template.selectList("board.select",map);
		
		BoardVO[] boardVOs = null;
		
		if(list != null){
			boardVOs = new BoardVO[list.size()];
			list.toArray(boardVOs);
		}
		
		return boardVOs;
	}
	
	public BoardVO getView(int board_no){
		return template.selectOne("board.selectOne",board_no);
	}
	
	public boolean addBoard(BoardVO vo){
		if(template.insert("board.addBoard", vo) > 0)
			return true;
		
		return false;
	}
	
	public boolean delBoard(int board_no){
		
		if(template.update("board.delBoard", board_no) > 0)
			return true;
		
		return false;
	}
	
	public boolean modifyBoard(BoardVO vo){
		
		if(template.update("board.updateBoard", vo) > 0)
			return true;
		
		return false;
	}
	
	public CommentVO[] getComment(int board_no){
		List<CommentVO> list = template.selectList("board.selectComment", board_no);
		
		CommentVO[] commentVO = null;
		
		if(list != null){
			commentVO = new CommentVO[list.size()];
			list.toArray(commentVO);
		}
		return commentVO;
	}
	
	public boolean addComment(CommentVO vo){
		
		if(template.insert("board.addComment", vo) > 0)
			return true;
		
		return false;
	}
	
	public boolean delComment(int comment_no){
		
		if(template.update("board.delComment", comment_no) > 0)
			return true;
		
		return false;
	}
}
