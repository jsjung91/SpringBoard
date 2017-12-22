package com.ic.testboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.Common;
import dao.BoardDao;
import dao.CommentDao;
import dao.TestDao;
import util.Paging;
import vo.BoardVo;
import vo.CommentVo;

@Controller
public class BoardController {

	String view_path = "/WEB-INF/views/board/";

	@Autowired
	BoardDao dao;

	@Autowired
	CommentDao c_dao;

	@Autowired
	TestDao t_dao;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	public BoardController() {	
		System.out.println("---BoardController()--");
	}

	@RequestMapping("/board/reply_form.do")
	public String reply_form() {

		return view_path + "board_reply.jsp";
	}

	@RequestMapping("/board/reply.do")
	public String reply(BoardVo vo, Integer page, String search, String search_text, Model model) {

		String ip = request.getRemoteAddr();
		vo.setIp(ip);

		BoardVo baseVo = dao.selectOne(vo.getIdx());

		int res = dao.update_step(baseVo);

		vo.setRef(baseVo.getRef());
		vo.setStep(baseVo.getStep() + 1);
		vo.setDepth(baseVo.getDepth() + 1);

		res = dao.reply(vo);

		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text", search_text);

		return "redirect:list.do";
	}

	@RequestMapping("/board/view.do")
	public ModelAndView view(int idx) {

		BoardVo vo = dao.selectOne(idx);

		List<CommentVo> c_list = c_dao.selectList(idx);

		if (session.getAttribute("view_idx") == null) {

			dao.update_readhit(idx);
			session.setAttribute("view_idx", idx);
		}

		ModelAndView mv = new ModelAndView();

		mv.addObject("vo", vo);
		mv.addObject("c_list", c_list);

		mv.setViewName(view_path + "board_view.jsp");
		return mv;
	}

	@RequestMapping("/board/list.do")
	public String selectList(String search, String search_text, Integer page, Model model) {

		int current_page = 1;
		if (page != null)
			current_page = page;

		int start = (current_page - 1) * Common.Board.BLOCK_LIST + 1;
		int end = start + Common.Board.BLOCK_LIST - 1;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		if (search != null && !search.isEmpty()) {
			if (search.equals("subject_content_name")) {
				map.put("subject", search_text);
				map.put("content", search_text);
				map.put("name", search_text);
			} else if (search.equals("name")) {

				map.put("name", search_text);

			} else if (search.equals("subject")) {

				map.put("subject", search_text);

			} else if (search.equals("content")) {

				map.put("content", search_text);

			}
		}

		int rowTotal = dao.selectRowTotal(map);

		String search_param = String.format("search=%s&search_text=%s", search, search_text);
		String menuPage = Paging.getPaging("list.do", 
				search_param, 
				current_page, 
				rowTotal,
				Common.Board.BLOCK_LIST, Common.Board.BLOCK_PAGE);
		
		List<BoardVo> list = dao.selectList(map);

		session.removeAttribute("view_idx");

		// Model
		model.addAttribute("list", list);
		model.addAttribute("menuPage", menuPage);

		return view_path + "board_list.jsp";
	}

}
