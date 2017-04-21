package mybatis.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int board_no, sub_no;
	private String mem_id, board_contents, board_fname_ori, board_fname_svr, board_date, board_title;
	
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getSub_no() {
		return sub_no;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public String getBoard_fname_ori() {
		return board_fname_ori;
	}
	public void setBoard_fname_ori(String board_fname_ori) {
		this.board_fname_ori = board_fname_ori;
	}
	public String getBoard_fname_svr() {
		return board_fname_svr;
	}
	public void setBoard_fname_svr(String board_fname_svr) {
		this.board_fname_svr = board_fname_svr;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
}