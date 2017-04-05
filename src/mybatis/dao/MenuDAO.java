package mybatis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MenuVO;

public class MenuDAO {
	@Autowired
	private SqlSessionTemplate template;

	/**
	 * 메뉴 목록 가져오기
	 * 
	 * @return MenuVO
	 */
	public MenuVO[] getMenu() {
		List<MenuVO> list = template.selectList("menu.selectMenu");
		MenuVO[] ar = null;

		if (list != null && list.size() > 0) {
			ar = new MenuVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
}
