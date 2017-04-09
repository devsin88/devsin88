package spring.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BoardDAO;
import mybatis.dao.MenuDAO;
import mybatis.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private MenuDAO menuDAO;
	@Autowired
	private BoardDAO boardDao;
	
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
	public ModelAndView title(int menu_no) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("menu_no", menu_no);
		
		mv.setViewName("/board/board-sub");
		
		return mv;
	}
	
	@RequestMapping("/subtitle.sin")
	public ModelAndView subTitle(int menu_no, int sub_no, String start) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
		}
		
		session.setAttribute("sub_no", sub_no);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("start", start==null?0:start);
		mv.addObject("menu_no", menu_no);
		mv.addObject("sub_no", sub_no);
		
		mv.setViewName("/board/board-list");
		
		return mv;
	}
	
	@RequestMapping("/boardview.sin")
	public ModelAndView boardView(int menu_no, int sub_no, int board_no, String start) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
		}
		
		session.setAttribute("sub_no", sub_no);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("start", start==null?0:start);
		mv.addObject("menu_no", menu_no);
		mv.addObject("sub_no", sub_no);
		
		mv.setViewName("/board/board-list");
		
		return mv;
	}
	
	@RequestMapping("/paging.sin")
	public ModelAndView paging(int start, int length, int draw) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
		}
		
		
		ModelAndView mv = new ModelAndView();
		
		Object object = session.getAttribute("sub_no");
		int sub_no = object == null? 1 : (int)object;
		
		Map<String, Integer> map = new HashMap<>(); 
		map.put("sub_no", sub_no);
		map.put("begin", start+1);
		map.put("end", start+length);
		
		BoardVO[] vo = boardDao.getBoard(map);
		mv.addObject("vo", vo);
		mv.addObject("draw", draw);
		mv.addObject("start", start);
		
		
		mv.addObject("recordsTotal", boardDao.getCount(sub_no) );
		
		mv.setViewName("/board/board-json");
		
		return mv;
	}
	
}
