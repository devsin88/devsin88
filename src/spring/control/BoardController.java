package spring.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.dao.MenuDAO;
import mybatis.vo.MemberVO;
import spring.util.EncryptUtil;

@Controller
public class BoardController {
	
	@Autowired
	private MenuDAO menuDAO;
	
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping("/index.sin")
	public ModelAndView index(String title, String sub_title) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("title", title);
		mv.setViewName("/main/index");
		
		return mv;
	}
	
	@RequestMapping("/title.sin")
	public ModelAndView title(String title, String sub_title) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("title", title);
		mv.setViewName("/main/indexsdfsdf");
		
		return mv;
	}
	
	
}
