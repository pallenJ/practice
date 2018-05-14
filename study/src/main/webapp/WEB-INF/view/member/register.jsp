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
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name='viewport' content='width=device-width, initial-scale=1.0' />

<title>register</title>

<script>
	$(function() {
		$('#signUpBtn').click(function() {
			var rsa = new RSAKey();
			rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
			$('#email').val(rsa.encrypt($('#reg_email').val()));
			$('#name').val(rsa.encrypt($('#reg_name').val()));
			$('#pw').val(rsa.encrypt($('#reg_pw').val()));
			$('#reg_frm').submit();
		});
		
		
		/* $('#reg_email').keyup(function() {

		});  *///end on 
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
		
		
		$('#emailPfshow').click(function() {
	 		$.ajax(
				{
					      type: 'POST'
						, url: '${pageContext.request.contextPath}' +'/emailPf'
						, data : {
							'email' : $('#reg_email').val()
						} 
						, success: function(data) { 
							$("#checkMsg").html(data);
							$('#emailPfshow').remove();	
						}
						,error : function(request, status, error) {
							alert('code:' + request.status + '\n' + 'message:'
									+ request.responseText + '\n' + 'error:'
									+ error);
						}

				}	
			); 
		});		
		
		
	});
	
	
	function allChecking() {

		$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}' + '/check',
					data : {
						'email' : $('#reg_email').val()
					},
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {

						var id = $('#reg_id');
						var site = $('#reg_site');
						var email = $('#reg_email');
						var flag = data.match('true');
						var pfFlag = $('#pf-result').val()=='true';
						var temp = (email.val())
								.match(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
						var regFlag = temp == null;
						
						
						if(pfFlag){
							
							id.removeClass('is-invalid');
							id.addClass('is-valid')
							site.removeClass('is-invalid');
							site.addClass('is-valid');
							$('#checkMsg').html('<p style="color:green">사용가능한 이메일 입니다</p>');
							$('#reg_id').prop('disabled', true);
						}else if (regFlag) {
							var msg = email.val() == '@' ? '이메일을 입력해 주세요'
									: '유효하지 않은 이메일 입니다'+'<br>';
							id.removeClass('is-valid');
							id.addClass('is-invalid')
							site.removeClass('is-valid');
							site.addClass('is-invalid');
							$('#checkMsg').html(
									'<p style="color:red">' + msg + '</p>');
						} else{
							/*
							var scls = flag ? 'is-valid' : 'is-invalid';
							var other = flag ? 'is-invalid' : 'is-valid';
							var color = flag ? 'green' : 'red';
							 */
							 $('#emailPfshow').prop('disabled',!flag);
							 
							var scls = flag ? '' : 'is-invalid';
							var other = flag ? 'is-invalid' : '';
							var color = flag ? 'blue' : 'red';

							id.removeClass(other);
							id.addClass(scls)

							site.removeClass(other);
							site.addClass(scls)

							$('#checkMsg').html(
									'<p style="color:'
											+ (flag ? 'blue' : 'red') + '">'
											+ (flag ? '사용가능한' : '이미 사용중인')
											+ '이메일 입니다.'
											+ (flag ? '이메일 인증을 진행해 주세요.&nbsp;' : '<br>')
											+ '</p>');
						}
						//flag&&email.val() !=null&&email.val()!=''
						flag = flag && !regFlag && pwChecking()&&pfFlag
								&& ($('reg_name') != '');
						$('#signUpBtn').prop('disabled', !flag);
						return data;
					},
					error : function(request, status, error) {
						alert('code:' + request.status + '\n' + 'message:'
								+ request.responseText + '\n' + 'error:'
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
	
	<jsp:include page='/WEB-INF/view/_form/member/register.jsp'></jsp:include>


</body>
</html>

