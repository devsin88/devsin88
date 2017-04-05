package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;
import spring.util.EncryptUtil;

@Controller
public class MainController {
	
	@Autowired
	private MemberDAO memberDAO;

	@RequestMapping("/index.sin")
	public String index() throws Exception{
		return "/main/index";
	}
	
	@RequestMapping("/login.sin")
	public String login() throws Exception{
		return "/main/page-login";
	}
	
	@RequestMapping(value="/login.sin", method=RequestMethod.POST)
	public ModelAndView login(String id, String pwd) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo = memberDAO.searchId(id);
		
		if(vo.getPwd().equals(EncryptUtil.getEncrypt(pwd, vo.getP_key()))){
			mv.addObject("login_session", vo);
		}
		mv.setViewName("/main/page-login");
		
		return mv;
	}
	
	@RequestMapping("/signup.sin")
	public String signup() throws Exception{
		return "/main/page-signup";
	}
	
	@RequestMapping(value="/signup.sin", method=RequestMethod.POST)
	public ModelAndView signup(MemberVO vo) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		vo.setP_key(EncryptUtil.generateSalt());
		vo.setPwd(EncryptUtil.getEncrypt(vo.getPwd(), vo.getP_key()));
		
		System.out.println(vo.getP_key());
		System.out.println(vo.getPwd());
		
		mv.addObject("status", memberDAO.addUser(vo));
		mv.setViewName("/main/index");
	
		return mv;
	}
}
