<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/nav.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
		$(function () {	
		$('#login_btn').click(function() {
			var rsa = new RSAKey();
	        rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());

	        var email = $('#user_email');
			var pw    = $('#user_pw');
			
			$("#email").val(rsa.encrypt($('#user_email').val()));
	        $("#pw").val(rsa.encrypt($('#user_pw').val()));
			$('#login_frm').submit();//계정정보를 암호화 처리
	        });
		$("input").keydown(function (key) {
 
        if(key.keyCode == 13){
            $("#login_btn").click();
        }
 
    })
		});
		
</script>




</head>
<body>

	<jsp:include page="/WEB-INF/view/_form/member/login.jsp"></jsp:include>
	
</body>
</html>