package mybatis.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private String name;
	
	// 스프링 환경에서 첨부파일을 받을 때에는 반드시 MultiPartFile 이라는 자료형으로 받아야 한다.
	private MultipartFile file;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
