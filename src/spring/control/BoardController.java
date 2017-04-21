package spring.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BoardDAO;
import mybatis.dao.MenuDAO;
import mybatis.vo.BoardVO;
import mybatis.vo.CommentVO;
import mybatis.vo.FileVO;
import mybatis.vo.MenuVO;
import mybatis.vo.SubMenuVO;
import spring.util.FileCopyUtil;

@Controller
public class BoardController {
	
	@Autowired
	private MenuDAO menuDAO;
	@Autowired
	private BoardDAO boardDao;
	
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	
	@RequestMapping("/index.sin")
	public ModelAndView index(String title, String sub_title) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
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
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("menu_no", menu_no);
		
		mv.setViewName("/board/board-sub");
		
		return mv;
	}
	
	@RequestMapping("/subtitle.sin")
	public ModelAndView subTitle(int menu_no, int sub_no) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		session.setAttribute("sub_no", sub_no);
		
		ModelAndView mv = new ModelAndView();

		mv.addObject("menu_no", menu_no);
		mv.addObject("sub_no", sub_no);
		
		mv.setViewName("/board/board-list");
		
		return mv;
	}
	
	@RequestMapping("/boardview.sin")
	public ModelAndView boardView(int menu_no, int sub_no, int board_no) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		//System.out.println(boardDao.getView(board_no).getBoard_contents());
		
		session.setAttribute("sub_no", sub_no);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", boardDao.getView(board_no));
		mv.addObject("cvo", boardDao.getComment(board_no));
		mv.addObject("cvo_count", boardDao.getComment(board_no).length);
		mv.addObject("board_no", board_no);
		mv.addObject("menu_no", menu_no);
		mv.addObject("sub_no", sub_no);
		
		mv.setViewName("/board/board-view");
		
		return mv;
	}
	
	@RequestMapping("/paging.sin")
	public ModelAndView paging(int start, int length, int draw) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
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
	
	@RequestMapping("addComment.sin")
	public ModelAndView addComment(CommentVO vo) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		ModelAndView mv = new ModelAndView();
		
		//System.out.println(vo.getBoard_no() + "/" + vo.getComment_contents() + "/" + vo.getMem_id());
		
		if(boardDao.addComment(vo)){
			mv.addObject("cvo", boardDao.getComment(vo.getBoard_no()));
		}
		
		mv.setViewName("/board/comment-json");
		return mv;
	}
	
	@RequestMapping("delComment.sin")
	public ModelAndView delComment(int comment_no, int board_no) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		ModelAndView mv = new ModelAndView();
		
		//System.out.println(vo.getBoard_no() + "/" + vo.getComment_contents() + "/" + vo.getMem_id());
		
		if(boardDao.delComment(comment_no)){
			mv.addObject("cvo", boardDao.getComment(board_no));
		}
		
		mv.setViewName("/board/comment-json");
		return mv;
	}
	
	@RequestMapping(value="boardWrite.sin", method=RequestMethod.GET)
	public ModelAndView boardWrite(int menu_no, int sub_no) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("menu_no", menu_no);
		mv.addObject("sub_no", sub_no);
		
		mv.setViewName("/board/board-write");
		return mv;
	}
	
	@RequestMapping(value="boardWrite.sin", method=RequestMethod.POST)
	public ModelAndView boardWriteAdd(BoardVO vo, int menu_no, int sub_no, String type) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		ModelAndView mv = new ModelAndView();
		
		//System.out.println(vo.getBoard_fname_ori());
		
		// 파일 첨부 확인
		// 파일 미 첨부시 비어있는 MultipartFile이 들어간다. ( null 아님 )
		if(vo.getFile().getSize() > 0){
			// 파일들이 저장되는 "/upload"라는 폴더의 경로를 절대 경로로 만든다.
			String path = request.getServletContext().getRealPath("/attached_file");
			
			File pFile = new File(path);
			
			if(!pFile.exists())
				pFile.mkdirs();
			
			//System.out.println(path);
			
			// 첨부된 파일을 가져온다.
			MultipartFile m_file = vo.getFile();
			
			// 파일명을 가져온다.
			String filename = m_file.getOriginalFilename();
			vo.setBoard_fname_ori(filename);
			
			// 이미 저장된 파일인지를 판단.
			filename = FileCopyUtil.checkSameFilename(filename, path);
			vo.setBoard_fname_svr(filename);
			
			// 파일 저장
			m_file.transferTo(new File(path+System.getProperty("file.separator")+filename));
		}
		
		//vo.setBoard_contents(vo.getBoard_contents().replaceAll("\n","<br/>"));
		
		if(type.equals("add"))
			boardDao.addBoard(vo);
		else if(type.equals("modify")){
			BoardVO bvo = boardDao.getView(vo.getBoard_no());
			bvo.setBoard_title(vo.getBoard_title());
			bvo.setBoard_contents(vo.getBoard_contents());
			
			if(vo.getBoard_fname_ori() != null){
				bvo.setBoard_fname_ori(vo.getBoard_fname_ori());
				bvo.setBoard_fname_svr(vo.getBoard_fname_svr());
			}
			
			boardDao.modifyBoard(bvo);
		}
		
		mv.addObject("menu_no", menu_no);
		mv.addObject("sub_no", sub_no);
		
		mv.setViewName("/board/board-list");
		return mv;
	}
	
	@RequestMapping(value="uploadImage.sin")
	public @ResponseBody Map<String,String> uploadImage(FileVO vo) throws Exception{

		Map<String, String> map = new HashMap<>();
		
		// 파일 첨부 확인
		// 파일 미 첨부시 비어있는 MultipartFile이 들어간다. ( null 아님 )
		if(vo.getFile().getSize() > 0){
			// 파일들이 저장되는 "/upload"라는 폴더의 경로를 절대 경로로 만든다.
			String path = request.getServletContext().getRealPath("/image");
			
			File pFile = new File(path);
			
			if(!pFile.exists())
				pFile.mkdirs();
			
			//System.out.println(path);
			
			// 첨부된 파일을 가져온다.
			MultipartFile m_file = vo.getFile();
			// 파일명을 가져온다.
			String filename = m_file.getOriginalFilename();
			
			// 이미 저장된 파일인지를 판단.
			filename = FileCopyUtil.checkSameFilename(filename, path);
			
			// 파일 저장
			m_file.transferTo(new File(path+System.getProperty("file.separator")+filename));
			
			map.put("url", "http://localhost:8080/Devsin88/image/"+filename);
		}
		
		return map;
	}
	
	@RequestMapping(value="deleteBoard.sin")
	public ModelAndView deleteBoard(int board_no, int menu_no, int sub_no) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		ModelAndView mv = new ModelAndView();
		
		boardDao.delBoard(board_no);
		
		mv.addObject("menu_no", menu_no);
		mv.addObject("sub_no", sub_no);
		
		mv.setViewName("/board/board-list");
		return mv;
	}
	
	@RequestMapping(value="modifyBoard.sin")
	public ModelAndView modifyBoard(int board_no, int menu_no, int sub_no) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("menu_no", menu_no);
		mv.addObject("sub_no", sub_no);
		mv.addObject("bvo", boardDao.getView(board_no));
		
		mv.setViewName("/board/board-write");
		return mv;
	}

	@RequestMapping(value="downFile.sin")
	public @ResponseBody void downFile(String board_fname_ori, String board_fname_svr) throws Exception{
		
		// 최초 접속시 메뉴 읽어오기
		if(session.getAttribute("menu") == null){
			session.setAttribute("menu", menuDAO.getMenu());
			session.setAttribute("language", menuDAO.getLanguage());
		}
		
		Map<String, Boolean> map = new HashMap<>();
		
		String path = request.getServletContext().getRealPath("/attached_file")+ File.separator + board_fname_svr;
		
		File f = new File(path);
		
		//System.out.println(path);
		
		if(f.exists()){
			long f_size = f.length();	// 다운받으려는 파일의 크기
			
			byte[] buf = new byte[(int)f_size];
			int size = -1;
			
			// 필요한 스트림 선언
			BufferedInputStream bis = null;
			InputStream fis = null;
			
			BufferedOutputStream bos = null;
			ServletOutputStream fos = null;
			
			// 서버를 요청할 때 클라이언트에게 파일을 보내기 위해 필요한 스트림은 response 객체를 통하여 스트림을 얻어낸다.
			// 그것이 바로 ServletOutputStream 이다.
			try{
				// 화면에 대화창을 보여준다.
				// http프로토콜의 헤더 값을 변경해야 대화창이 나온다.
				response.setContentType("application/x-msdownload");
				
				String header = request.getHeader("User-Agent");
				
				//System.out.println(header);
				
				if(header.contains("MSIE") || header.contains("Trident")){
					response.setHeader("Content-Disposition", String.format("attachment;filename=%s", URLEncoder.encode(board_fname_ori,"UTF-8").replaceAll("\\+", "%20")));
				}else{
					response.setHeader("Content-Disposition", String.format("attachment;filename=%s", new String(board_fname_ori.getBytes("UTF-8"),"ISO-8859-1")));
				}
				
				//-------------------------------------------------------
			
				// 여기서 부터 파일과 연결된 InputStream을 만들고 클라이언트에게 보낼 outputStream을 만든다.
				fis = new FileInputStream(f);
				bis = new BufferedInputStream(fis);
				
				// outputStream은 만들때 문제가 될 만한게 있다.
				// 보통 화면에 표현하기 위해 쓰는 코드가
				// out.println() : 이것은 " PrintWriter out; " 이 내장 객체로 이미 있는 객체이다.
				// 그러므로 이것을 쓰지 않겠다고 삭제 해야 한다.
				fos = response.getOutputStream();
				bos = new BufferedOutputStream(fos);
				
				// 파일의 자원을 읽을 inputStream 과 그 자원을 클라이언트에게 보낼 outputStream 을 모두 준비.
				while((size = bis.read(buf)) != -1){
					bos.write(buf,0,size);	// 클라이언트에게 보낸다.
					bos.flush();
				}
				map.put("state", true);
				
			}catch(Exception e){
				e.printStackTrace();
				map.put("state", false);
			}finally{
				try{
					if(bis != null)
						bis.close();
					if(fis != null)
						fis.close();
					if(bos != null)
						bos.close();
					if(fis != null)
						fos.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
		}
		return;
	}
}
