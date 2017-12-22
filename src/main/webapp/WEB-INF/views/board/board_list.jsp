<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>목록보기</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html;">
<script language="JavaScript">

function search()
{
   var search      = document.getElementById("search").value;
   var search_text = document.getElementById("search_text").value;

   if(search != '' && search_text==''){
	   alert('검색어를 입력하세요!!');
	   return;
   }
   
   location.href = "list.do?search="+search+"&search_text=" + encodeURIComponent(search_text);
   
}

/* 검색구분 유지 */
window.onload = function(){
	var s_array = [ "","content","subject","name","subject_content_name"];
	var search = document.getElementById("search");
	for(var i=0; i<s_array.length; i++){
		if(s_array[i] == '${ param.search }'){
			search[i].selected = true;
			return;
		}
	}
};

</script>
</head>
<body>

<!--로케이션 & 로그인끝-->
<!--타이틀 영역-->
<table width="700" align="center">
<tr>
<td>
<table width="690" height="50" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td><img src="${ pageContext.request.contextPath }/resources/img/title_04.gif"></td>
	</tr>
</table>
<!--타이틀 영역--끝-->
</td>
</tr>
<tr>
<td>
<!--LIST START-->
<table width="690" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="690" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="50" class="td_a">번호</td>
				<td width="2" class="td_b"><img src="${ pageContext.request.contextPath }/resources/img/td_bg_01.gif"></td>
				<td class="td_b" width="300">제목</td>
				<td width="2" class="td_b"><img src="${ pageContext.request.contextPath }/resources/img/td_bg_01.gif"></td>
				<td width="90" class="td_b">작성자</td>
				<td width="2" class="td_b"><img src="${ pageContext.request.contextPath }/resources/img/td_bg_01.gif"></td>
				
				<td width="90" class="td_b">작성일</td>
				<td width="2" class="td_b"><img src="${ pageContext.request.contextPath }/resources/img/td_bg_01.gif"></td>
				<td width="60" class="td_c">조회수</td>
			</tr>
<!-- 데이터가 있는경우 -->
<!--  for(BoardVo vo : list)  -->
<c:forEach var="vo" items="${ list }">
			<tr>
				<td align="center" class="td_a_1">${ vo.no }(${ vo.idx })</td>
				<td class="td_b_1"><img src="${ pageContext.request.contextPath }/resources/img/td_bg_02.gif"></td>
				<td class="td_b_1 left">
				
				<!-- 댓글이면 붙여라 -->
				<c:forEach begin="1" end="${ vo.depth }">
				   &nbsp;&nbsp;
				</c:forEach>
				<c:if test="${ vo.depth != 0 }">
				 ㄴ				
				</c:if>
				
				<a href="view.do?idx=${ vo.idx }&page=${ (param.page==null || param.page=='' ) ? 1 : param.page }&search=${ param.search}&search_text=${ param.search_text}" class="num">
					${ vo.subject }(${ vo.ip })
				</a></td>
				<td class="td_b_1"><img src="${ pageContext.request.contextPath }/resources/img/td_bg_02.gif"></td>
				<td align="center" class="td_b_1">${ vo.name }</td>
				<td class="td_b_1"><img src="${ pageContext.request.contextPath }/resources/img/td_bg_02.gif"></td>
				<td align="center" class="td_b_1">${ vo.regdate }</td>
				<td class="td_b_1"><img src="${ pageContext.request.contextPath }/resources/img/td_bg_02.gif"></td>
				<td align="center" class="td_c_1">${ vo.readhit }</td>
			</tr>
</c:forEach>

<!-- 게시물이 없는경우 -->
<c:if test="${ empty list }">  
			<tr>
				<td align="center" colspan="11" width="100%" height="50" style="border:1 solid #efefef">
					현재 등록된 글이 없습니다.
				</td>
			</tr>
</c:if>


		</table>
		</td>
	</tr>
	<tr>
		<td height="8"></td>
	</tr>
	<tr>
		<td>
		<table width="690" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F5F4">
			<tr>
				<td width="7"><img src="${ pageContext.request.contextPath }/resources/img/search_bg_01.gif"></td>
				<td class="f11" align="center">
				    <!-- 검색메뉴 -->
				    <div>
				         <select id="search">
                            <option value="">::::전체보기::::</option>
                            <option value="content">내용</option>
                            <option value="subject">제목</option>
                            <option value="name">작성자</option>
                            <option value="subject_content_name">제목+내용+작성자</option> 				             
				         </select>
				         <input id="search_text" value="${ param.search_text }">  
				         <input type="button" value="검색" onclick="search();">
				    </div>
				    <!-- 페이징메뉴  -->
                    <div style="font-size: 15pt;">
                        ${ menuPage }
                    </div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td>

		<img src="${ pageContext.request.contextPath }/resources/img/btn_reg.gif" onClick="JavaScript:location.href='insert_form.do'" style="cursor:hand">

		</td>
	</tr>

</table>
<!--WRITE,MODIFY,REPLY END-->
</td>
</tr>
</table>
</body>

</html>