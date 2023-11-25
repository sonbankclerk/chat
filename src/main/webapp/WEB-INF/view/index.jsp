<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        #black-bar {
            background-color: black;
            height: 50px;
            width: 100%;
        }
        #white-line{
            height: 1px;
            width: 100%;
            background-color: white;
        }
        #container {
            display: flex;
            height: calc(100vh - 50px); /* 화면 높이에서 검은색 바의 높이를 뺀 나머지 높이 */
        }

        #left {
            flex: 1;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #right {
            flex: 1;
            background-color: black;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        #login-form {
            width: 90%;
            margin: auto;
            text-align: center;
        }

        #login-form span {
            font-size: 3.5vw; /* 뷰포트 너비의 2%에 해당하는 크기로 폰트 크기를 설정합니다. */
        }

        #login-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        #left-image {
            width: 70%; /* 이미지의 최대 가로 너비를 50%로 설정 */
            max-width: 100%; /* 이미지의 최대 가로 너비를 100%로 설정 */
            max-height: 100%; /* 이미지의 최대 세로 높이를 100%로 설정 */
            height: auto; /* 높이를 자동으로 조절하여 가로 세로 비율을 유지합니다. */
            object-fit: contain; /* 또는 cover */
        }
        #span-div{
            margin-bottom: 5vw;
        }
        #login-button{
            width: 50%;
            margin: 0 auto;
        }
        #login-button button{
            width: 100%;
            background-color: white;
            border-radius: 0.5vw;
            border: none;
            margin: 1vw;
            height: 5.5vw;
            font-size: 4vw;
        }
    </style>
<body>

    <div id="black-bar"></div>

    <div id="container">
        <div id="left">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo.png" id="left-image">
        </div>
        <div id="right">
            <div id="white-line"></div>
            <div id="login-form">
                <!-- 오른쪽 내용 -->
                <div id="span-div">
                    <span>Chat Dit에서</span><br>
                    <span>새로운 채팅을 시작하세요</span><br>
                </div>
                <div id="login-button">
                    <a href="login.do"><button>Log in</button></a>
                    <a href="signup.do"><button>Sign up</button></a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>