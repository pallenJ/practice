<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
<script type="text/javascript"
	src="http://www-cs-students.stanford.edu/~tjw/jsbn/rsa.js"></script>
<script type="text/javascript"
	src="http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js"></script>
<script type="text/javascript"
	src="http://www-cs-students.stanford.edu/~tjw/jsbn/prng4.js"></script>
<script type="text/javascript"
	src="http://www-cs-students.stanford.edu/~tjw/jsbn/rng.js"></script>

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

<input type="hidden" id="saveID" value="${sessionScope.loginEmail}">

<h1>email: ${sessionScope.loginEmail}</h1>


<link rel="stylesheet"
	href="https://bootswatch.com/4/spacelab/bootstrap.min.css">
<link rel="stylesheet"
	href="https://bootswatch.com/4/spacelab/bootstrap.css">
<link rel="stylesheet"
	href="https://bootswatch.com/4/spacelab/_variables.scss">
<link rel="stylesheet"
	href="https://bootswatch.com/4/spacelab/_variables.scss">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="#">Navbar</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarColor03" aria-controls="navbarColor03"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarColor03">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Features</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
			<li class="nav-item"><a class="nav-link" href="#">About</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search">
			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</nav>
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

<c:if test="${arl_login}">
	<script type="text/javascript">
		alert('이미 로그인한 상태입니다.');
		history.back();
	</script>
</c:if>

<c:if test="${re_fail}">
	<script>
		alert('회원가입에 실패했습니다');
		history.back();
	</script>
</c:if>