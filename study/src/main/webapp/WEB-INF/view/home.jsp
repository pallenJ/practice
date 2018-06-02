<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
	
	<c:if test="${re_back}">
		<script type="text/javascript">
			history.back();
		</script>
	</c:if>
	<!-- <script type="text/javascript">
		$(function() {
			$('#email-test').click(function() {
			if(!confirm('설정된 이메일로 인증번호를 보내드리겠습니다.')) return;
			window.open('emailpf','new','left=50, top=50, width=400, height=500');
			
			})
		});
	
    </script> -->
<html>
<head>
<title>home</title>
</head>
<body>
	<h1><a href='login'>로그인</a></h1>
	<h1><a href='logout'>로그아웃</a></h1>
	<h1><a href='register'>회원가입</a></h1>
	<!-- <h1><a href="#" id='email-test'>이메일 인증</a></h1> -->
	<h1><a href='memberList'>멤버 리스트</a></h1>
	<h1><a href='board'>게시판</a></h1>
</body>
</html>