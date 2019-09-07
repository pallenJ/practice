<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<%
try{
String [] themes = new String[]{
		"cerulean","cosmo","cyborg","darkly","flatly","journal","litera",
		"lumen","lux","materia","minty","pulse","sandstone","simplex",
		"sketchy","slate","solar","spacelab","superhero","united","yeti"
				};	
pageContext.setAttribute("themes", themes);
pageContext.setAttribute("theme", themes[5]);//21개 테마
}catch(Exception e){
pageContext.setAttribute("theme", "journal");
	
}			
%>
<script type="text/javascript">
</script>
<div id ="tm-change"></div>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" id = "b-css"
	href="https://bootswatch.com/4/${theme}/bootstrap.css">
<link rel="stylesheet" id = "b-min-css"
	href="https://bootswatch.com/4/${theme}/bootstrap.min.css">
<link rel="stylesheet" id = "v-scss"
	href="https://bootswatch.com/4/${theme}/_variables.scss">
<link rel="stylesheet" id = "b-scss"
	href="https://bootswatch.com/4/${theme}/_bootswatch.scss">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
    </ul>
    <div class="collapse navbar-collapse">
    	
    	<select class = "btn btn-outline-info">
    		<optgroup label="테마">
    			<c:forEach items = "${themes}" var = "btheme">
    			<option class = "theme-options" value="${btheme}" id = "a">${btheme}
    			</c:forEach>
    		</optgroup>
    		
    	
    	</select>
    
    </div>
   
    
    <script type="text/javascript">
    	$(function () {
    		$("select").change(function(){
    			var now_theme = $(this).val();	
    			$("#b-css").prop("href", "https://bootswatch.com/4/"+now_theme+"/bootstrap.css")
    			$("#b-min-css").prop("href", "https://bootswatch.com/4/"+now_theme+"/bootstrap.min.css")
    			$("#v-scss").prop("href", "https://bootswatch.com/4/"+now_theme+"/_variables.scss")
    			$("#b-scss").prop("href", "https://bootswatch.com/4/"+now_theme+"/_bootswatch.scss")
    			
    			}		
    		);
		})
    </script>
    
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>