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
        #content{
            width: 30vw;
            margin: 0 auto;
            margin-left: 30vw;
            font-size: 1rem;
        }
        table{
            width: 100%;
        }
        button{
            width: 100%;
            color: white;
            background-color: black;
            border-radius: 10rem;
            border: none;
            height: 5.5vh;
        }
        input{
            box-shadow: 0 2px 1px rgba(0, 0, 0, 0.15);
            height: 3vh;
            width: 95%;
        }
        label{
            display: inline-block;
        }
        .left-td{
            width: 20%;
        }
        .right-td{
            width: 80%;
        }
        table{
            text-align: center;
        }
        table tr{
            line-height: 10vh;
        }
        label{
            margin-right: 1vw;
        }
    </style>
<body>
    <div id="black-bar"></div>
    <a href="index.do"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
    <div id="content">
        <form action="userInsert.do" method="post">
            <table>
                <tr>
                    <td class="left-td"></td>
                    <td class="right-td"><h1>Sign up</h1></td>
                </tr>
                <tr>
                    <td class="left-td"><label for="id">ID</label></td>
                    <td class="right-td"><input type="text" id="id" name="id"></td>
                </tr>
                <tr>
                    <td class="left-td"><label for="name">Nickname</label></td>
                    <td class="right-td"><input type="text" id="name" name="name"></td>
                </tr>
                <tr>
                    <td class="left-td"><label for="mail">Email</label></td>
                    <td class="right-td"><input type="email" id="mail" name="mail"></td>
                </tr>
                <tr>
                    <td class="left-td"><label for="pw">Password</label></td>
                    <td class="right-td"><input type="password" id="pw" name="pw"></td>
                </tr>
                
                <tr>
                    <td class="left-td"></td>
                    <td class="right-td"><button type="submit">Create Account</button></td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>