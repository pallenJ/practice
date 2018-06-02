<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>

<div align='center'>
		<br> <br>
		<h1>로그인</h1>
		<br> <br> <br>

		<div class='col-lg-2'>

			<label class='sr-only' for='user_email'>e-mail</label> <input type='email'
				class='form-control' name='user_email' id='user_email' placeholder='E-mail'
				required>

		</div>

		<br>

		<div class='col-lg-2'>
			<label class='sr-only' for='pw'>pw</label> <input type='password'
				class='form-control' name='user_pw' id='user_pw' placeholder='Password'
				required>
		</div>


		<form action='login' method='post' name='login_frm' id='login_frm'>
			<input type='hidden' id='RSAModulus' value='${RSAModulus}' /> 
			<input type='hidden' id='RSAExponent' value='${RSAExponent}' /> 
			<input type='hidden' name='email' id='email'/> <br>
			<input type='hidden' name='pw'    id='pw'/>
			 <label><input type='checkbox' name='remember'> Remember me</label>
		</form>
			<br> 
		<button type='button' class='btn btn-info btn-lg' id='login_btn'
			style='width: 16%; height: 50px;'>로그인</button>
		<form action='register'>
			<hr style='width: 20%'>
			<br>
			<button type='submit' class='btn btn-secondary btn-lg'
				style='width: 16%; height: 50px;'>회원가입</button>
		</form>
	</div>