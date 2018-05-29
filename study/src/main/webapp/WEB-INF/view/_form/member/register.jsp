<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<br>
	<br>
	<div class='page-header' align='center'>
		<h1>회원가입</h1>
	</div>
	<br>
	<div class='col-md-6' style='float: none; margin: 0 auto;'>


		<!--이메일 입력-->
		<input type='hidden' class='form-control checking' id='reg_email'
			name='reg_email' disabled='disabled' required>
		<div class='form-group'>

			<label for='email'>E-mail</label>
			
			<div class='input-group'>
				<input type='hidden' id='eCheckRs' /> 
				<input type='text'
					class='form-control checking' name='reg_id' id='reg_id'> @
				<input type='text' class='form-control checking' name='reg_site'
					id='reg_site' disabled='disabled'> <select
					name='email_select' class='form-control checking' id='se_site'>
					<option value='' selected>선택하세요</option>
					<option value='naver.com'>naver.com</option>
					<option value='gmail.com'>gmail.com</option>
					<option value='daum.net'>daum.net</option>
					<option value='yahoo.co.kr'>yahoo.co.kr</option>
					<option value='ist'>직접입력</option>
				</select> <span class='input-group-btn'> </span>

			</div>

				<div id='checkMsg'>
				
				</div>
		</div>
			<button type="button" id="emailPfshow" class="btn btn-primary">이메일 인증하기</button>
			<input type="hidden" id='mailcheck-result' disabled="disabled">
			<input type="hidden" id='pf-result' disabled="disabled">




		<div class='form-group'>
			<label for='id'>name</label> <input type='text'
				class='form-control checking' id='reg_name' name='reg_name'
				placeholder='이름' required>
		</div>



		<!--비밀번호 입력-->
		<div class='form-group'>
			<label for='pw' class='form-control-label'>비밀번호</label> <input
				type='password' class='form-control  checking' id='reg_pw'
				name='reg_pw' placeholder='비밀번호' required>
		</div>
		<!--비밀번호 확인-->
		<div class='form-group has-success'>
			<label for='pwcheck' class='form-control-label'>비밀번호 확인</label> <input
				type='password' class='form-control checking' id='reg_pwCheck'
				name='reg_pwcheck' placeholder='비밀번호 확인'>
			<p id='pwsame' style='color: red;'></p>
		</div>

		<div class='form-group'>
			<label>약관 동의</label>

			<div class='checkbox agreeBox' align='right'>
				<span class='fa fa-check'></span> <input id='agree' type='checkbox'
					autocomplete='off' checked> <a href='#'>이용약관</a>에 동의합니다.
			</div>
		</div>
		<div class='form-group text-center'>
			<button type='submit' class='btn btn-info' id='signUpBtn'
				disabled='disabled'>
				회원가입<i class='fa fa-check spaceLeft signUpBtn'></i>
			</button>
			<button type='button' onClick='history.back();'
				class='btn btn-warning'>
				가입취소<i class='fa fa-times spaceLeft'></i>
			</button>
		</div>

		<form action='register' method='post' id='reg_frm' name='reg_frm'>
			<input type='hidden' id='RSAModulus' value='${RSAModulus}' /> <input
				type='hidden' id='RSAExponent' value='${RSAExponent}' /> <input
				type='hidden' id='email' name='email' /> <input type='hidden'
				id='name' name='name' /> <input type='hidden' id='pw' name='pw' />
			<!-- <button type='submit' style='display: hidden;' id='submitBtn'></button> -->
		</form>


	</div>