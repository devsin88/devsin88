package mybatis.vo;

import java.io.Serializable;
import java.util.List;

public class MenuVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private int menu_no;
	private String menu_title;
	
	private List<SubMenuVO> sm_list;

	public int getMenu_no() {
		return menu_no;
	}

	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}

	public String getMenu_title() {
		return menu_title;
	}

	public void setMenu_title(String menu_title) {
		this.menu_title = menu_title;
	}

	public List<SubMenuVO> getSm_list() {
		return sm_list;
	}

	public void setSm_list(List<SubMenuVO> sm_list) {
		this.sm_list = sm_list;
	}
}
