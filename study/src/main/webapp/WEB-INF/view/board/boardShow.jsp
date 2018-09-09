<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<jsp:include page='/WEB-INF/view/nav.jsp'></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[${detail.board}] ${detail.title}</title>
</head>
<body>

	<script type="text/javascript">
		$(function() {
			var email = '<%=request.getSession().getAttribute("loginEmail")%>';
			var flag = email=='null';
			$('#writeR').attr('disabled', flag);
		});
	</script>

	<c:if test='${re_back}'>
		<script type='text/javascript'>
			alert('비밀글입니다.');
		</script>
	</c:if>

	<div align="center">
		<table class='table table-bordered  table-hover table-primary'
			align='center' style='position: relative; width: 80%; top: 30px'>

			<thead>

				<tr>
					<td colspan='50%'><label> <font color="red" size="3">[${detail.board}]</font>
							<font size="4">${detail.title} </font>

					</label>
					<td><a href="#">${detail.writer}</a>
					<td>조회수 ${detail.read}번
					<td>${detail.reg}
			</thead>
			<tbody>
				<tr>
					<th colspan='100%' style='height: 500px;'><textarea
							style='width: 100%; height: 100%' disabled='disabled'>
					  
					   ${detail.content}  
					  
					</textarea></th>
				</tr>



			</tbody>

			<tfoot>

				<tr>
					<td colspan="95%"><textarea
							style="width: 100%; height: 100px;"></textarea>
					<td colspan="5%">
						<button class="btn btn-success" id="writeR" 
						style="width: 100%; height: auto;">댓글입력</button>
						<c:forEach var='rlist' items='${rlist}'>

							<tr>
								<td colspan="10%">${rlist.writer}
								<td colspan="85%">${rlist.content}
								<td colspan="5%">${rlist.reg}
						</c:forEach>
			</tfoot>

		</table>

	</div>

</body>

</html>