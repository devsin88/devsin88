package mybatis.vo;

import java.io.Serializable;

public class LanguageVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private int language_no;
	private String language_name;
	
	
	public int getLanguage_no() {
		return language_no;
	}
	public void setLanguage_no(int language_no) {
		this.language_no = language_no;
	}
	public String getLanguage_name() {
		return language_name;
	}
	public void setLanguage_name(String language_name) {
		this.language_name = language_name;
	}
}
