<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%-- <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
 --%>


<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
<!-- <link rel='stylesheet'
	href='https://bootswatch.com/4/spacelab/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://bootswatch.com/4/spacelab/bootstrap.css'>
<link rel='stylesheet'
	href='https://bootswatch.com/4/spacelab/_variables.scss'>
<link rel='stylesheet'
	href='https://bootswatch.com/4/spacelab/_variables.scss'>
 -->


<script type='text/javascript'>
	
	$(function() {
		
		$('#pf-btn').click(function() {
			
			var pfkey=$('#pfKey').val();
			var flag = pfkey==$('#emailIns').val();
			
			$('#pf-result').val(flag);

			if(flag){
				alert('인증이 완료되었습니다.')
				$('#reg_id').removeClass('is-invalid');
				$('#reg_id').addClass('is-valid')
				$('#reg_site').removeClass('is-invalid');
				$('#reg_site').addClass('is-valid');
				$('#checkMsg').html('<p style="color:green">사용가능한 이메일 입니다</p>');
				$('#reg_id').prop('disabled', true);
			}else{
				alert('인증번호를 다시 입력해 주세요.')
			}
			
		});
		$('#emailIns').keyup(function() {
			/* alert(pfkey.length); */
			$('#pf-btn').prop('disabled', $('#emailIns').val().length!=4);
		})
	});
	
</script>
<br>
	<div style='float: none; margin: 0 auto;'
		>
		<input type='hidden' value='${pfKey}' id='pfKey'>
		
		<div class='form-group'>
			
			<div class='input-group'>
				<input type='text' class='form-control' id='emailIns' name='emailIns'
					placeholder='인증번호를 입력해 주세요' required> <span class='input-group-btn'>
					<button class='btn btn-success' id='pf-btn' type='button' disabled='disabled'>
						확인<i class='fa fa-mail-forward spaceLeft'></i>
					</button>
				</span>
			</div>
		</div>
	</div>
