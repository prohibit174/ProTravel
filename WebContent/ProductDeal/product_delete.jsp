<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String p_num = request.getParameter("p_num");
	System.out.println(p_num);
%>
<!DOCTYPE html>
<html>
<head>
    
</head>
<%@include file="../header.jsp" %>

<body>
<!--  
<h1> 여기가 컨텐츠 부분입니다.<br><br> 원하는 거 집어 넣으면 돼요</h1>-->

<h4 align="center">물품이 삭제되었습니다.
</h4>
  <div class="btn-box center">
            <a class="btn-more" href="mainAction.product"><span>메인으로 가기</span> </a>
            <a class="btn-more" href="listAction.product"><span>확인하기</span></a>
  </div>
<%@include file="../footer.jsp" %>
</body>
</html>