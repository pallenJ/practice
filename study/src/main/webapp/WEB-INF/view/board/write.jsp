<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<jsp:include page='/WEB-INF/view/nav.jsp'></jsp:include>
<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<title>write</title>

<script type='text/javascript'>

</script>

</head>
<body>
<form action='<c:url value='/write'></c:url>' method='post'>
		<table class='table table-bordered  table-hover table-primary'
			align='center' style='position: relative; width: 80%; top: 30px'>

			<thead>
				<tr>
					<th colspan='100%'><h1 align='center'>글쓰기</h1></th>
				</tr>

				<tr>
					<td colspan='20%'>

						<div class='dropdown'>
							<label>게시판</label> <select class='form-control' name='board'>
								<option>공지</option>
								<option>이벤트</option>
								<option>자유게시판</option>
							</select>
						</div>

					</td>

					<td><label>제목</label> <input type='text'
						style='width: 100%; top: 50%' name='title' id='title' required /></td>
				</tr>
				<tr>
					<th colspan='100%'>
						<div class='form-group'>
							<label for='file' class='user-input area-30'></label>
							<input type='file' class='form-control-file '
								id='upload' name='upload' multiple='multiple'>
						</div>

					</th>
				</tr>

			</thead>
			<tbody>
				<tr>
					<th colspan='100%' style='height: 500px;'><textarea
							style='width: 100%; height: 100%' name='content' required /></textarea></th>
				</tr>



			</tbody>
			<tfoot>
				<tr>
					<td colspan='100%'>

						<div align='right'>
							<input type='radio' name='secret' value='false' checked='checked'/>공개
							<input type='radio' name='secret' value='true' />비공개

						</div>

					</td>
				</tr>
				<tr>
					<td colspan='100%'>
						

						<div class='bs-component' align='center'>
							<button type='submit' class='btn btn-primary'
								data-toggle='tooltip' style='width: 25%'>글쓰기</button>
							<label style='width: 25%'></label>
							<button type='button' class='btn btn-warning'
								onclick='history.back();' data-toggle='tooltip'
								style='width: 25%'>취소</button>

						</div>
					</td>
				</tr>

			</tfoot>
		</table>
	</form>
</body>
</html>