<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@include file="../includes/header.jsp"%>	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<div class="row">
			<div class="col-lg-12">
				
				<h1>Board Register</h1>
				
			</div>
			<!-- /.col-lg-12-->
		</div>
		<!-- /.row -->
		
	
		<div class="row">
			<div class="col-lg-12">
				
				<div class = "panel panel-default">
					<div class = "panel-body">
						<form role="form" action="/board/register" method="post">
							<div class = "form-group">
								<label>Title</label><input class="form-control" name ="title" required>
							</div>
							
							<div class = "form-group">
								<label>Text Area</label>
								<textarea class="form-control" rows="3" name="content" required></textarea>
							</div>
							
							<div class="form-group">
								<label>Writer</label><input class="form-control" name ="writer" required>
							</div>
							<button type="submit" class ="btn btn-primary">Submit</button>
			<button type="reset" class ="btn btn-warning">Reset</button>
						</form>
					</div>
					<!--end panel-body -->
				</div>
				<!--end panel -->
				
			</div>
			
			<!-- /.col-lg-12-->
		</div>
		<!-- /.row -->
		
</body>
    
<%@include file="../includes/footer.jsp"%>
</html>