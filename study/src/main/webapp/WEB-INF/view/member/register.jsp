<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<jsp:include page='/WEB-INF/view/nav.jsp'></jsp:include>
<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<html>
<head>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>register</title>

<script>
	$(function() {
		$('#signUpBtn').click(function() {
			var rsa = new RSAKey();
			rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
			$("#email").val(rsa.encrypt($('#reg_email').val()));
			$("#name").val(rsa.encrypt($('#reg_name').val()));
			$("#pw").val(rsa.encrypt($('#reg_pw').val()));
			alert($('#email').val());
			$('#reg_frm').submit();
		});

		$('#reg_email').keyup(function() {

		}); //end on 

		$('.checking').keyup(function() {
			setEmail();
			pwChecking();
			allChecking();

		})

		$('#se_site').click(function() {
			var site = $('#se_site').val();
			if (site == 'ist') {
				$('#reg_site').attr('disabled', false);
			} else {
				$('#reg_site').val(site);
				$('#reg_site').attr('disabled', true);
			}
			setEmail();
			allChecking();
		});
		/* $('#se_site').keyup(function() {
			setEmail();
		}); */

	});

	function allChecking() {

		$
				.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}' + '/check',
					data : {
						'email' : $('#reg_email').val()
					},
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {

						var id = $('#reg_id');
						var site = $('#reg_site');
						var email = $('#reg_email');
						var flag = data.match("true");
						var temp = (email.val())
								.match(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
						var regFlag = temp == null;
						if (regFlag) {
							var msg = email.val() == '@' ? '이메일을 입력해 주세요'
									: '유효하지 않은 이메일 입니다';
							id.removeClass('is-valid');
							id.addClass('is-invalid')
							site.removeClass('is-valid');
							site.addClass('is-invalid')
							$('#checkMsg').html(
									'<p style="color:red">' + msg + '</p>');
						} else {
							var scls = flag ? 'is-valid' : 'is-invalid';
							var other = flag ? 'is-invalid' : 'is-valid';
							var color = flag ? 'green' : 'red';
							id.removeClass(other);
							id.addClass(scls)
							site.removeClass(other);
							site.addClass(scls)
							$('#checkMsg').html(
									'<p style="color:'
											+ (flag ? 'green' : 'red') + '">'
											+ (flag ? '사용가능한' : '이미 사용중인')
											+ '이메일 입니다</p>');
						}
						//flag&&email.val() !=null&&email.val()!=''
						flag = flag && !regFlag && pwChecking()
								&& ($('reg_name') != '');
						$('#signUpBtn').prop('disabled', !flag);
						return data;
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}

				}); //end ajax

	}
	function setEmail() {
		$('#reg_email').val($('#reg_id').val() + '@' + $('#reg_site').val());
	}
	function pwChecking() {

		var pw = $('#reg_pw').val();
		var pwCheck = $('#reg_pwCheck').val();
		var flag = pw == pwCheck;
		var scls = flag ? 'is-valid' : 'is-invalid';
		var other = flag ? 'is-invalid' : 'is-valid';
		/* alert(scls); */
		$('#pwsame').html(flag ? '<br>' : '비밀번호가 일치하지 않습니다.')
		if (pw != '' || pwCheck != '') {
			$('#reg_pw').removeClass(other);
			$('#reg_pwCheck').removeClass(other);
			$('#reg_pw').addClass(scls);
			$('#reg_pwCheck').addClass(scls);
			return flag;
		}
	};
</script>


</head>
<body>

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
			<div class="input-group">
				<input type='hidden' id='eCheckRs' /> <input type="text"
					class="form-control checking" name="reg_id" id="reg_id"> @
				<input type="text" class="form-control checking" name="reg_site"
					id="reg_site" disabled="disabled"> <select
					name="email_select" class="form-control checking" id="se_site"
					style="width: 5px">
					<option value="" selected>선택하세요</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="ist">직접입력</option>
				</select> <span class="input-group-btn"> </span>
			</div>
			<div id="checkMsg">
				<br>
			</div>
		</div>




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
				disabled="disabled">
				회원가입<i class='fa fa-check spaceLeft signUpBtn'></i>
			</button>
			<button type='button' onClick='history.back();'
				class='btn btn-warning'>
				가입취소<i class='fa fa-times spaceLeft'></i>
			</button>
		</div>

		<form action='register' method='post' id='reg_frm' name='reg_frm'>
			<input type="hidden" id="RSAModulus" value="${RSAModulus}" /> <input
				type="hidden" id="RSAExponent" value="${RSAExponent}" /> <input
				type='hidden' id='email' name='email' /> <input type='hidden'
				id='name' name='name' /> <input type='hidden' id='pw' name='pw' />
			<!-- <button type='submit' style='display: hidden;' id='submitBtn'></button> -->
		</form>


	</div>


</body>
</html>

