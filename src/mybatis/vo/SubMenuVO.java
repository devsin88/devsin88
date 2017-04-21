package mybatis.vo;

import java.io.Serializable;

public class SubMenuVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private int sub_no, menu_no;
	private String sub_title;
	
	public int getSub_no() {
		return sub_no;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public String getSub_title() {
		return sub_title;
	}
	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}
}
