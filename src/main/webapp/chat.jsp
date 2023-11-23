<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script>
        var socket = new WebSocket("ws://localhost:8080/project/chat/1");

        socket.onmessage = function(event) {
            var chatArea = document.getElementById("chatArea");
            chatArea.innerHTML += event.data + "<br>";
        };

        function sendMessage() {
            var messageInput = document.getElementById("messageInput");
            socket.send(messageInput.value);
            messageInput.value = "";
        }
    </script>
</head>
<body>

    <div id="chatArea"></div>
    <input type="text" id="messageInput">
    <button onclick="sendMessage()">전송</button>
</body>
</html>