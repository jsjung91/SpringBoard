<%@page import="dao.CommentDao"%>
<%@page import="vo.CommentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    //check_password.jsp?idx=11&c_pwd=hong@123
    /* request.setCharacterEncoding("utf-8");
    int c_idx = Integer.parseInt(request.getParameter("c_idx"));
    String c_pwd = request.getParameter("c_pwd");
    
    //idx을 이용해서 CommentVo객체를 얻어온다..
    CommentVo vo = CommentDao.getInstance().selectOne(c_idx);
    
    
    String res = "no";
    if(c_pwd.equals(vo.getC_pwd())){
    	res = "yes";
    }
    
    //System.out.println("res=" + res);
    
    //결과전송
    out.print(res); */

%>    


