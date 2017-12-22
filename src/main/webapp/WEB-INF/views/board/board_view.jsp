<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>

<script language="JavaScript">
	function del() {
		var f = document.f;
		var c_pwd = f.c_pwd.value;//사용자가 입력한 비밀번호

		if (c_pwd == '') {
			alert('비빌번호를 입력하세요');
			return;
		}

		//Ajax통해서 비밀번호 맞는지 여부 체크
		var url = "check_password.jsp";
		//비밀번호에 한글또는 특수문자가 포함되어있으면 인코딩해서 전송
		var param = "idx=${ vo.idx }&c_pwd=" + encodeURIComponent(c_pwd);
		sendRequest(url, param, resultDeleteFn, "GET");

	}

	function resultDeleteFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//서버에서 보내준 데이터 수신
			var data = xhr.responseText;

			if (data.indexOf('no') != -1) {
				alert('비밀번호가 맞지않습니다');
				return;
			}

			//alert('삭제합니다');
			//삭제확인작업
			if (confirm('정말삭제?') == false) {
				return;
			}

			//자바스크립트을 이용해서 삭제처리
			location.href ="delete.do?idx=${vo.idx}&page=${ param.page }"
					     + "&search=${ param.search}&search_text=${param.search_text}";

		}
	}

	function modify() {

		var f = document.f;
		var c_pwd = f.c_pwd.value;//사용자가 입력한 비밀번호

		if (c_pwd == '') {
			alert('비빌번호를 입력하세요');
			return;
		}

		//Ajax통해서 비밀번호 맞는지 여부 체크
		var url = "check_password.jsp";
		//비밀번호에 한글또는 특수문자가 포함되어있으면 인코딩해서 전송
		var param = "idx=${ vo.idx}&c_pwd=" + encodeURIComponent(c_pwd);
		sendRequest(url, param, resultModifyFn, "GET");

	}

	function resultModifyFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//서버에서 보내준 데이터 수신
			var data = xhr.responseText;

			if (data.indexOf('no') != -1) {
				alert('비밀번호가 맞지않습니다');
				return;
			}

			//자바스크립트을 이용해서 수정처리
			location.href = "modify_form.do?idx=${vo.idx}"+
			                "&page=${ param.page }&search=${ param.search}&search_text=${param.search_text}";
					

		}
	}

	//답글달기
	function reply() {

		location.href = 
		"reply_form.do?idx=${ vo.idx }&page=${ param.page }"+
		"&search=${ param.search}&search_text=${param.search_text}";
		

	}
	
	
	function send(f){
		
		var c_content = f.c_content.value;
		var c_name    = f.c_name.value;
		var c_pwd     = f.cc_pwd.value;
		
		if(c_content==''){
			alert('내용을 입력하세요!!');
			f.c_content.focus();
			return;
		}
		
		if(c_name==''){
			alert('이름을 입력하세요!!');
			f.c_name.focus();
			return;
		}
		
		if(c_pwd==''){
			alert('비밀번호을 입력하세요!!');
			f.cc_pwd.focus();
			return;
		}
		//          CommentInsertAction : /board/comment_insert.do
		f.action = "comment_insert.do";
		f.submit();
		
		
	}
	
	//댓글삭제
	var g_f;
	function del_comment(f){
		//alert(f.c_idx.value +"댓글 삭제");
		g_f = f;
		var c_idx = f.c_idx.value;
		var c_pwd = f.c_pwd2.value;//사용자가 입력한 비밀번호

		if (c_pwd == '') {
			alert('비빌번호를 입력하세요');
			return;
		}

		//Ajax통해서 비밀번호 맞는지 여부 체크
		var url = "comment_check_password.jsp";
		//비밀번호에 한글또는 특수문자가 포함되어있으면 인코딩해서 전송
		var param = "c_idx="+ c_idx +"&c_pwd=" + encodeURIComponent(c_pwd);
		sendRequest(url, param, resultCommentDelFn, "GET");
		
	}
	
	function resultCommentDelFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//서버에서 보내준 데이터 수신
			var data = xhr.responseText;

			if (data.indexOf('no') != -1) {
				alert('비밀번호가 맞지않습니다');
				return;
			}
			
			if(confirm("정말삭제?")==false)return;

			g_f.action = "comment_delete.do";//CommentDeleteAction
			g_f.submit();
			

		}
	}
	
	
</script>
</HEAD>

<BODY>
	<table width="690" height="50" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td><img src="${ pageContext.request.contextPath }/resources/img/title_04.gif"></td>
		</tr>
	</table>

	<form name="f" method="post">
		<table width="690" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="120" height="25" class="td_d">제목</td>
				<td class="td_d_1">${ requestScope.vo.subject }</td>
			</tr>
			<tr>
				<td width="120" height="25" class="td_d_4">작성자</td>
				<td class="td_d_2">${ vo.name }</td>
			</tr>
			<tr>
				<td width="120" height="25" class="td_d_4">작성일</td>
				<td class="td_d_2">${ vo.regdate }</td>
			</tr>
			<tr>
				<td width="120" class="td_d_4">내용</td>
				<td class="td_d_3" width="570"
					style="word-wrap: break-word; word-break: break-all">
					<div width="100%">
					  <pre>${ vo.content }</pre>
					</div>
				</td>
			</tr>

			<tr>
				<td width="120" height="25" class="td_d_4">비밀번호(${ vo.pwd })</td>
				<td class="td_d_2"><input type="password" name="c_pwd">
				</td>
			</tr>

		</table>

		<table width="690" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td><img src="${ pageContext.request.contextPath }/resources/img/btn_list.gif"
					onClick="javaScript:location.href='list.do?page=${ param.page }&search=${ param.search}&search_text=${ param.search_text}'"
					style="cursor: hand"> 
					<!-- 메인글에 대해서만 답변글를 달아라..  --> 
					<c:if
						test="${ vo.depth eq 0  }">
						<img src="${ pageContext.request.contextPath }/resources/img/btn_reply.gif" onClick="reply()" style="cursor: hand">
					</c:if> 
					
					<img src="${ pageContext.request.contextPath }/resources/img/btn_modify.gif" onClick="modify()"
					style="cursor: hand"> <img src='${ pageContext.request.contextPath }/resources/img/btn_delete.gif'
					onClick='del()' style='cursor: hand'></td>
			</tr>
		</table>
	</form>

	<p>
	<hr>
	<!-- 댓글입력창 -->
	<form>
	  <input type="hidden" name="idx" value="${ vo.idx }">
	  <input type="hidden" name="page" value="${ param.page }">
	  <input type="hidden" name="search" value="${ param.search }">
	  <input type="hidden" name="search_text" value="${ param.search_text }">
	  <table border="0">
	     <tr>
	        <td>
	           <textarea name="c_content" rows="3" cols="45"></textarea>
	        </td>
	     </tr>
	     <tr>
	       <td>
	       작성자:<input name="c_name" size="10">
	       비밀번호:<input type="password" size="10" name="cc_pwd">
	       <input type="button" value="등록" onclick="send(this.form);">
	       </td>
	     </tr>
	     
	  </table>
	</form>
	
	<hr>
	<!-- 댓글출력 -->
	<c:forEach var="c_vo" items="${ c_list }">
	   <form>
	       <input type="hidden" name="idx" value="${ vo.idx }">
	  	   <input type="hidden" name="page" value="${ param.page }">
	       <input type="hidden" name="search" value="${ param.search }">
	       <input type="hidden" name="search_text" value="${ param.search_text }">
	       <input type="hidden" name="c_idx" value="${ c_vo.c_idx }">
		   <div style="width:400px;">
		     <div style="background-color: #cccccc; color:green; min-height: 50px;">
		         ${ c_vo.c_content }
		     </div>
		     <div>작성자:${ c_vo.c_name }(${ c_vo.c_regdate })</div>
		     <div>
		        비밀번호(${ c_vo.c_pwd }):
		                 <input type="password" name="c_pwd2">
		                 <input type="button" value="삭제" 
		                        onclick="del_comment(this.form);">
		     </div>
		     <hr>
		   </div>
	   </form>
	   
	   
	</c:forEach>
	
	
	
		
		
		
		
		
		
</BODY>
</HTML>