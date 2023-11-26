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
    
<div class="navbar">
    <div class="nav-section">
        <%out.println("네비게이션 바"); %>
    </div>
</div>
<div class="container">
    <div class="left-section">
        <%out.println("친구목록"); %>
    </div>
    
    <div class="mid-section">
        <%out.println("채팅"); %>
    </div>
    <div class="chat-input-section">
        <input type="text" placeholder="메시지 입력">
        <button>전송</button>
    </div>

    <div class="right-section">
        <%out.println("채팅방목록"); %>
    </div>
</div>
</body>
</html>