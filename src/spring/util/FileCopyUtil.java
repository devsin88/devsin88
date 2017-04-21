package spring.util;

import java.io.File;

public class FileCopyUtil {
	
	public static String checkSameFilename( String fileName, String path ){
		
		// 파일 이름을 가려내자
		int period = fileName.lastIndexOf(".");
		
		String f_name = fileName.substring(0, period);
		String f_suffix = fileName.substring(period, fileName.length());
		
		// 전체 경로
		String saveFileName = path + System.getProperty("file.separator");
		
		new File(saveFileName);
		
		// 같은 이름이 있다면 번호를 붙여야 한다.
		int idx = 0;
		File file = null;
		
		do{
			StringBuffer sb = new StringBuffer();
			sb.append(saveFileName);
			sb.append(f_name);
			if(idx != 0){ sb.append(idx); }
			sb.append(f_suffix);
			idx++;
			
			file = new File(sb.toString());
			
		}while(file!=null && file.exists());
		
		if(idx > 1){
			f_name = f_name + String.valueOf(idx-1);
		}
		
		return f_name+f_suffix;
	}
}
