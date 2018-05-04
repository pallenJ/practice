<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>

<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rsa.js"></script>
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js"></script>
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/prng4.js"></script>
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rng.js"></script>

<script type="text/javascript">
		$(function () {
			
		$('#login_btn').click(function() {
			var rsa = new RSAKey();
	        rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());

	        var email = $('#user_email');
			var pw    = $('#user_pw');
			
			$("#email").val(rsa.encrypt(email.val()));
	        $("#pw").val(rsa.encrypt(pw.val()));
			$('#login_frm').submit();
	        

	
	//사용자 계정정보를 암호화 처리

			
			
		})
		
		});
		
</script>
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



</head>
<body>


	<div align="center">
		<br> <br>
		<h1>로그인</h1>
		<br> <br> <br>

		<div class="col-lg-2">

			<label class="sr-only" for="user_email">e-mail</label> <input type="email"
				class="form-control" name="user_email" id="user_email" placeholder="E-mail"
				required>

		</div>

		<br>

		<div class="col-lg-2">
			<label class="sr-only" for="pw">pw</label> <input type="password"
				class="form-control" name="user_pw" id="user_pw" placeholder="Password"
				required>
		</div>


		<form action="login" method="post" name="login_frm" id="login_frm">
			<input type="hidden" id="RSAModulus" value="${RSAModulus}" /> 
			<input type="hidden" id="RSAExponent" value="${RSAExponent}" /> <br>
			<input type="hidden" name="email" id="email" value="${RSAExponent}" /> <br>
			<input type="hidden" name="pw"    id="pw" value="${RSAExponent}" /> <br>
			<!--  <label>
      <input type="checkbox"> Remember me
    </label> -->
			<br>
		</form>
			<br> <br>
		<button type="button" class="btn btn-info btn-lg" id="login_btn"
			style="width: 16%; height: 50px;">로그인</button>
		<form action="register">
			<hr style="width: 20%">
			<br>
			<button type="submit" class="btn btn-secondary btn-lg"
				style="width: 16%; height: 50px;">회원가입</button>
		</form>
	</div>
</body>
</html>