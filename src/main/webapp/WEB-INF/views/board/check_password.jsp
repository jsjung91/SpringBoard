<%@page import="dao.BoardDao"%>
<%@page import="vo.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    //check_password.jsp?idx=11&c_pwd=hong@123
   /*  request.setCharacterEncoding("utf-8");
    int idx = Integer.parseInt(request.getParameter("idx"));
    String c_pwd = request.getParameter("c_pwd");
    
    //idx을 이용해서 BoardVo객체를 얻어온다..
    BoardVo vo = BoardDao.getInstance().selectOne(idx);
    
    
    String res = "no";
    if(c_pwd.equals(vo.getPwd())){
    	res = "yes";
    }
    
    //System.out.println("res=" + res);
    
    //결과전송
    out.print(res); */

%>    


