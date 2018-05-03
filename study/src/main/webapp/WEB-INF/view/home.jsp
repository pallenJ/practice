<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
	<c:if test="${re_home}">
		<script type="text/javascript">
			location.href = 'home';
		</script>
	</c:if>
	
	<c:if test="${re_back}">
		<script type="text/javascript">
			history.back();
		</script>
	</c:if>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1><a href="login">로그인</a></h1><br>
	<h1><a href="logout">로그아웃</a></h1>
	<h1><a href="register">회원가입</a></h1>
</body>
</html>