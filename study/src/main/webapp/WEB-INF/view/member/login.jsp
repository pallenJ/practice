<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${arl_login}">
		<script type="text/javascript">
			alert('이미 로그인한 상태입니다.');
			history.back();
		</script>
	</c:if>
	
	<c:if test="${login_fail}">
		<script type="text/javascript">
			alert('잘못된 이메일/ 비밀번호 입니다.');
			history.back();
		</script>
	</c:if>
	
	<c:if test="${re_home}">
		<script type="text/javascript">
			location.href = 'home';
		</script>
	</c:if>

	<div align="center">
		<br> <br>
		<h1>로그인</h1>
		<br> <br> <br>
		<form action="login" method="post">

			<div class="col-lg-2">

				<label class="sr-only" for="email">e-mail</label> <input
					type="email" class="form-control" name="email" placeholder="E-mail"
					required>

			</div>

			<br>

			<div class="col-lg-2">
				<label class="sr-only" for="pw">pw</label> <input type="password"
					class="form-control" name="pw" placeholder="Password" required>
			</div>


			<br> <br>
			<button type="submit" class="btn btn-info btn-lg"
				style="width: 16%; height: 50px;">로그인</button>
			<br>
			<!--  <label>
      <input type="checkbox"> Remember me
    </label> -->
			<br>
		</form>
		<form action="register">
			<hr style="width: 20%">
			<br>
			<button type="submit" class="btn btn-secondary btn-lg"
				style="width: 16%; height: 50px;">회원가입</button>
		</form>
		</div>
</body>
</html>