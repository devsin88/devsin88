package mybatis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MemberVO;

public class MemberDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	/**
	 * 아이디 중복 검사 or 로그인 확인
	 * 
	 * @param String
	 * @return MemberVO
	 */
	public MemberVO searchId(String mem_id){
		return template.selectOne("member.searchId", mem_id);
	}
	
	/**
	 * 이메일 중복 검사
	 * 
	 * @param String
	 * @return MemberVO
	 */
	public MemberVO searchEmail(String mem_email){
		return template.selectOne("member.searchEmail", mem_email);
	}
	
	/**
	 * 회원 가입
	 * 
	 * @param MemberVO
	 * @return boolean
	 */
	public boolean addUser(MemberVO vo){
		boolean isSucc = false;
		
		try {
			isSucc = template.insert("member.addUser", vo) > 0 ? true : false;
		} catch (Exception e) {
			return false;
		}
		
		return isSucc;
	}
}
