<%@ page language="java" contentType="text/html;charset=Shift_JIS"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>コンサート一覧</title>
</head>
<body>
<br>
<br>
<br>
<Div Align="right">
<FONT size=\"6\"><a href="./userLogin.jsp"> ユーザログインはこちら</a></FONT>
</Div>
<center>
<br><br><br><br><br>

<% String userID = (String) session.getAttribute("userID");
String userPasswd = (String) session.getAttribute("userPasswd");
Boolean rogin = (Boolean) session.getAttribute("rogin");
String userName ;
if(rogin == null || rogin == false){
userName = "ゲスト";
session.removeAttribute("userID");
session.removeAttribute("userPasswd");
}

db.UserConnection ucon = db.UserConnection.getInstance();

%>


<br><br>
<a href="./concert.jsp">ホームへ</a>
</center>
</body>
</html>