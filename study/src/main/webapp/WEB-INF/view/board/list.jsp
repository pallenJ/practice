<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<jsp:include page='/WEB-INF/view/nav.jsp'></jsp:include>
<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
 <link rel="stylesheet" type="text/css" href="mystyle.css">
<title>Insert title here</title>

</head>
<body>
	<br>
	<div style='float: none; margin: 0 auto;width: 800px;'>
	<div align='right'> 
		<form action='board/write' method='get'>
			<input type='submit' value='글쓰기' class='btn btn-primary'>
		</form>
	 </div>
	<div align='center'>
		<table class='table table-striped table-bordered table-hover'>
			<tr>
				<th>no</th>
				<th>board</th>
				<th>title</th>
				<th>detail</th>
				<th>writer</th>
				<th>reg</th>
			</tr>
			<c:forEach var='board' items='${blist}'>
				<tr>
					<td>${board.no}
					<td>${board.board}
					<td>${board.title}
					<td>${board.content}
					<td>${board.writer}
					<td>${board.reg}
						
						
				</tr>
			</c:forEach>

		</table>
	
	
	
			<nav>
				<ul class="pagination pagination-lg center-block" style="text-align: center;">
					<c:if test="${pagingNum>0}">
						<li class="page-item"><a href='<c:url value='/board'></c:url>?pg=${pagingNum}'
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach begin="1" end="${pageLast}" varStatus="page">
						<c:set var="pageidx" value="${pagingNum+page.count}" />
						<c:choose>
							<c:when test="${pageidx == param.pg}">

								<li class="page-item active"><a class="page-link"
									href='<c:url value='/board'></c:url>?pg=${pageidx}'>${pageidx}</a>
								</li>
							</c:when>

							<c:otherwise>
								<li class="page-item"><a class="page-link" href='<c:url value='/board'></c:url>?pg=${pageidx}'>${pageidx}</a>
								</li>
							</c:otherwise>

						</c:choose>
					</c:forEach>

					<c:if test="${lastPage-pagingNum>10}">
							<li class="page-item"><a class="page-link" href='<c:url value='/board'></c:url>?pg=${pagingNum+11}'
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						
						
				</ul>
				
			</nav>
		</div>
	</div>
</body>
</html>