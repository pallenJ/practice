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
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	
		<c:if test="${re_success}">
           <script>
            location.href = 'home';
           </script>
       </c:if>
		<c:if test="${re_fail}">
           <script>
           alert('회원가입에 실패했습니다');
		   history.back();
           </script>
       </c:if>

<title>register</title>

<script>
	
	$(function() {
		
		$('#email').keyup(function() {
			
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}'+'/check',
				data : {
					'email':$('#email').val()
				},
				 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				 success : function(data) {
					var flag  = data.match("true");
					var scls  = flag ? 'is-valid' : 'is-invalid';
					var other = flag ? 'is-invalid' : 'is-valid';
					var color = flag ? 'green':'red';
					$('#email').removeClass(other);
					$('#email').addClass(scls)
					$('#checkMsg').html('<p style="color:'+(flag ? 'green':'red')+
							'">사용'+(flag?'':'불')+'가능한 이메일 입니다</p>');
					
		            /* $('#singnupBtn').attr('disabled', flag&&pwCheck()); */
					return data;
				}
			    ,error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
			
			}); //end ajax    
		}); //end on    
	});

	
	function pwChecking() {

		var pw = $('#pw').val();
		var pwCheck = $('#pwCheck').val();
		var flag = pw == pwCheck;
		var scls = flag ? 'is-valid' : 'is-invalid';
		var other = flag ? 'is-invalid' : 'is-valid';
		/* alert(scls); */
		$('#pwsame').html(flag ? '<br>' : '비밀번호가 일치하지 않습니다.')
		if (pw != '' || pwCheck != '') {
			$('#pw').removeClass(other);
			$('#pwCheck').removeClass(other);
			$('#pw').addClass(scls);
			$('#pwCheck').addClass(scls);
			$('#singnupBtn').prop('disabled', !flag);
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
		<form action="register" method="post">
			<!--이메일 입력-->
			<div class='form-group'>
			
				<label for='email'>E-mail</label>
				<div class="input-group">
					<input type='email' class='form-control' id='email' name='email'
						placeholder='이메일 주소' required> <span
						class="input-group-btn">
								
					</span>
				</div>
				<div id="checkMsg"><br></div>
			</div>

			<div class='form-group'>
				<label for='id'>nick name</label> <input type='id'
					class='form-control' id='id' name='id' placeholder='nick name'
					required>
			</div>



			<!--비밀번호 입력-->
			<div class='form-group'>
				<label for='pw' class='form-control-label'>비밀번호</label> <input
					type='password' class='form-control' id='pw' name='pw'
					onkeyup='pwChecking()' placeholder='비밀번호' required>
			</div>
			<!--비밀번호 확인-->
			<div class='form-group has-success'>
				<label for='pwcheck' class='form-control-label'>비밀번호 확인</label> <input
					type='password' class='form-control' id='pwCheck' name='pwcheck'
					onkeyup='pwChecking()' placeholder='비밀번호 확인'>
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
				<button type='submit' class='btn btn-info' id='singnupBtn' disabled="disabled">
					회원가입<i class='fa fa-check spaceLeft singnupBtn'></i>
				</button>
				<button type='button' onClick='history.back();'
					class='btn btn-warning'>
					가입취소<i class='fa fa-times spaceLeft'></i>
				</button>
			</div>

		</form>
		
		
	</div>


</body>
</html>

<div></div>