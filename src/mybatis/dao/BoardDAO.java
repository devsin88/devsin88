package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.BoardVO;

public class BoardDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int getCount(int sub_no){
		return template.selectOne("board.count", sub_no);
	}
	
	public BoardVO[] getBoard(Map<String, Integer> map){
		List<BoardVO> list = template.selectList("board.select",map);
		
		BoardVO[] boardDAOs = null;
		
		if(list != null){
			boardDAOs = new BoardVO[list.size()];
			list.toArray(boardDAOs);
		}
		
		return boardDAOs;
	}
}
