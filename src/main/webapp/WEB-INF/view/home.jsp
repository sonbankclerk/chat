<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
        body{
            padding: 0;
            margin: 0;
        }
        #black-bar {
            background-color: black;
            height: 20px;
            width: 100%;
        }
        img{
            width: 10%;
        }
	</style>
<body>
    <div id="black-bar"></div>
    <a href="index.do"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
	<% 
		out.print("<h1>"+session.getAttribute("name")+"</h1>"); 
	%>
</body>
</html>