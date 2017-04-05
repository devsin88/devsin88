package spring.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.dao.MenuDAO;
import mybatis.vo.MemberVO;
import spring.util.EncryptUtil;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping("/login.sin")
	public String login() throws Exception{
		return "/main/page-login";
	}
	
	@RequestMapping(value="/login.sin", method=RequestMethod.POST)
	public ModelAndView login(String mem_id, String mem_pwd) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo = memberDAO.searchId(mem_id);
		
		if(vo != null && vo.getMem_pwd().equals(EncryptUtil.getEncrypt(mem_pwd, vo.getMem_key()))){
			session.setAttribute("login", vo);
			mv.setViewName("/main/index");
		}else{
			mv.addObject("login_status", false);
			mv.setViewName("/main/page-login");
		}
		
		return mv;
	}
	
	@RequestMapping("/logout.sin")
	public String logout() throws Exception{
		session.removeAttribute("login");
		return "/main/index";
	}
	
	@RequestMapping("/signup.sin")
	public String signup() throws Exception{
		return "/main/page-signup";
	}
	
	@RequestMapping(value="/signup.sin", method=RequestMethod.POST)
	public ModelAndView signup(MemberVO vo) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		vo.setMem_key(EncryptUtil.generateSalt());
		vo.setMem_pwd(EncryptUtil.getEncrypt(vo.getMem_pwd(), vo.getMem_key()));
		
		mv.addObject("status", memberDAO.addUser(vo));
		mv.setViewName("/main/index");
	
		return mv;
	}
	
	@RequestMapping(value="/checkID.sin", method=RequestMethod.POST)
	public ModelAndView checkID(String id) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		if(memberDAO.searchId(id) == null)
			mv.addObject("chk", true);
		else
			mv.addObject("chk", false);
		
		mv.setViewName("/main/checkState");
	
		return mv;
	}
	
	@RequestMapping(value="/checkEmail.sin", method=RequestMethod.POST)
	public ModelAndView checkEmail(String email) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		if(memberDAO.searchEmail(email) == null)
			mv.addObject("chk", true);
		else
			mv.addObject("chk", false);
		
		mv.setViewName("/main/checkState");
	
		return mv;
	}
	
	@RequestMapping(value="/mypage.sin")
	public ModelAndView myPage() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("login") != null)
			mv.setViewName("/main/aboutMe");
		else
			mv.setViewName("/main/index");
	
		return mv;
	}
	
}
