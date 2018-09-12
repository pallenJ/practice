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
			var flag = email == 'null';
			$('#writeR').attr('disabled', flag);
			
			$('#writeR').click(function() {
				rInsert();
			});
			
		});

		function rInsert() {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}' + '/writeR',
				data : {
					'no' : $('#bno').val(),
					'secret':'false',
					'content' : $('#rcontent').val()
				},
				success : function(data) {
					location.reload();
				},
				error : function(request, status, error) {
					alert('code:' + request.status + '\n' + 'message:'
							+ request.responseText + '\n' + 'error:'
							+ error);
				}

			});
		}
	</script>


	<c:if test='${re_back}'>
		<script type='text/javascript'>
			alert('비밀글입니다.');
		</script>
	</c:if>

	<div align="center" style="">
		<table 
			align='center' style='position: relative; width: 80%; top: 30px;table-layout: fixed; word-break:break-all;'>

			<thead  class='table table-bordered  table-hover table-primary'>

				<tr>
					<td colspan='55%'><label> <font color="red" size="3">[${detail.board}]</font>
							<font size="4">${detail.title} </font>

					</label>
					<td colspan='15%'><a href="#" >${detail.writer}</a>
					<td colspan='10%'>조회수 ${detail.read}번
					<td colspan='20%'>${detail.reg}
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

					<td colspan="90%"><input type='hidden' id='bno'
						value='${detail.no}'> <textarea id='rcontent'
							style="width: 100%; height: 100px;"></textarea>
							
							
					<td colspan="10%">		
						<button class="btn btn-success" id="writeR"
							style="width: 100%; height: 100px;">댓글입력</button> <c:forEach
							var='rlist' items='${rlist}'>

							<tr style="height: auto;">
								<td colspan="18%" class='table-info'>${rlist.writer}
								<td colspan="67%" class='table-secondary'>
								<label>${rlist.content}</label>
								<c:if test="${sessionScope.loginEmail eq rlist.writer}">
								<div align="right">
								   <a href="#"><font size="2">수정</font></a>
								   <a href="#"><font size="2">삭제</font></a>
								</div>
								</c:if>
								
								<td colspan="15%" class='table-primary'>${rlist.reg}
								
						</c:forEach>
			</tfoot>

		</table>

	</div>

</body>

</html>