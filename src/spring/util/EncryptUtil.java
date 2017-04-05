package spring.util;

import java.security.MessageDigest;
import java.util.Random;

public class EncryptUtil {
	/**
	 * @param source
	 * @param salt
	 * @return Encrypt source data
	 */
	public static String getEncrypt(String source, String salt){
		
		String result = "";
		
		byte[] b_source = source.getBytes();
		byte[] b_salt = salt.getBytes();
		byte[] bytes = new byte[b_source.length + b_salt.length];
		
		System.arraycopy(b_source, 0, bytes, 0, b_source.length);
		System.arraycopy(b_salt, 0, bytes, b_source.length, b_salt.length);
		
		try{
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			messageDigest.update(bytes);
			
			byte[] bytedata = messageDigest.digest();
			
			StringBuffer sb = new StringBuffer();
			
			for(byte b : bytedata){
				sb.append(Integer.toString((b & 0xff) + 256,16).substring(1));
			}
			result = sb.toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * @return generate salt value
	 */
	public static String generateSalt(){
		
		Random random = new Random();
		byte[] salt = new byte[8];
		random.nextBytes(salt);
		
		StringBuffer sb = new StringBuffer();
		
		for(byte b : salt){
			//byte값을 Hex값으로 변환
			sb.append(String.format("%02x", b));
		}
		
		return sb.toString();
	}
}
