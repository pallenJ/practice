<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>

<script type="text/javascript">
		$(function () {	
		$('#login_btn').click(function() {
			loginFunction();
		});
		
		$("input").keydown(function (key) {
 
        if(key.keyCode == 13){
            $("#login_btn").click();
        }
 
    })
    
       function loginFunction(){
			$.ajax({
				
				type : 'POST',
				url : '${pageContext.request.contextPath}' + '/check',
				
				data : {
					'email' : $('#user_email').val()
				},
				success : function(data,request) {
					var flag = data.match('true');
					if(flag){						
					alert('없는 사용자 입니다.');
						if(confirm('회원가입 하시겠습니까?')!=0){
							location.href = 'register'
						}
					}else{
						var rsa = new RSAKey();
				        rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
						
				        var email = $('#user_email').val();
						var pw    = $('#user_pw').val();

						$("#email").val(rsa.encrypt(email));
				        $("#pw").val(rsa.encrypt(pw));
						$('#login_frm').submit();//계정정보를 암호화 처리후 전송
					}
					
				},
				error : function(request, status, error) {
					alert('fail');
					alert('code:' + request.status + '\n' + 'message:'
							+ request.responseText + '\n' + 'error:'
							+ error);
				}

			});
		}
    
		});
		
</script>




</head>
<body>

	<jsp:include page="/WEB-INF/view/_form/member/login.jsp"></jsp:include>
	
</body>
</html>