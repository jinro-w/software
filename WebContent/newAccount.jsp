<%@ page language="java" contentType="text/html;charset=Shift_JIS"%>
<%@ page import="db.ConnectionManager"%>
<%@ page import="db.UserConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("Windows-31J");
	String[] resultInfo = (String[]) request.getAttribute("ResultInfo");
	String able = "";
	String yose = "";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>Insert title here</title>
</head>
<body>
	<center>
		<% 
		if(request.getParameter("newAccount") != null){
			String userID = request.getParameter("userID");
			String name = request.getParameter("name");
			String passwd = request.getParameter("passwd");
			String adress = request.getParameter("adress");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			
			session.setAttribute("rogin", true);
			session.setAttribute("userID", userID);
			session.setAttribute("userPasswd", passwd);
			ConnectionManager.user().createNewAccount(userID, name, passwd, adress, phone, email);
		%>
		
		<br> <br> <FONT size="6">以下の情報で登録しました</FONT> <br><br>
		
		<table border="2">
			<tr>
				<td><FONT size="5">ユーザID</FONT></td>
				<td><FONT size="5"><%=userID%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">氏名</FONT></td>
				<td><FONT size="5"><%=name%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">パスワード</FONT></td>
				<td><FONT size="5"><%=passwd%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">住所</FONT></td>
				<td><FONT size="5"><%=adress%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">電話番号</FONT></td>
				<td><FONT size="5"><%=phone%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">メールアドレス</FONT></td>
				<td><FONT size="5"><%=email%></FONT></td>
			</tr>
		</table>
		<br>
		
		<%
		}else{
		%>

		<br> <br> <br> <br> <br> <br> <FONT
			size="6">ユーザ情報を入力してください</FONT> <br> <br> <br>
		<form method=post action="newAccount.jsp">
			ユーザID:<input type="text" name="userID"><br> 
			氏名:<input type="text" name="name"><br> 
			パスワード:<input type=password name="passwd" size=16 maxlength=12><br> 
			住所:<input type="text" name="adress"><br> 
			電話番号:<input type="text" name="phone"><br> 
			メールアドレス:<input type="text" name="email"><br> 
			<input type="submit" name="newAccount" value="登録する"></input>
		</form>

		<%
		}
		%>

		<p>
			<a href="./concert.jsp">ホームへ戻る</a>
		</p>
	</center>
</body>
</html>