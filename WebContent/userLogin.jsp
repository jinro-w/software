<%@ page language="java" contentType="text/html;charset=Shift_JIS"%>
<%@ page import="db.ConnectionManager"%>
<%@ page import="db.UserConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%!
String previousPage = null;
%>
<body>
	<center>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br> <FONT size="6">ログインしてください</FONT><br>
		<br>
		<br>
		<form method=post action="userLogin.jsp">
			ID:<input type="text" name="userID"><br> PASS:<input
				type=password name="passwd" size=16 maxlength=12> <input
				type=submit value="ロ
グイン">
		</form>
		<%
			request.setCharacterEncoding("UTF-8");
			String previous = request.getParameter("previousPage");
			if (previous != null) {
				previousPage = previous;
			} else if (previousPage == null) {
				previousPage = "./concert.jsp";
			}
			String nextPage = previousPage.toString();
			String id = request.getParameter("userID");
			String passwd = request.getParameter("passwd");
		%>
		<%
			if (id != null || passwd != null) {
				if (ConnectionManager.user().checkIDwithPass(id, passwd)) {
					session.setAttribute("rogin", true);
					session.setAttribute("userID", id);
					session.setAttribute("userPasswd", passwd);
					previousPage = null;
		%><jsp:forward page="<%=nextPage%>" />
		<%
			} else {
					out.println("ID またはPASS が違います．");
					session.setAttribute("rogin", false);
				}
			}
		%>
		<br>
		<br> <a href="./newAccount.jsp?previousPage=<%=nextPage%>">
			新規アカウント登録はこちら</a> <br>
		<br> <a href="./concert.jsp">ホームへ</a>
	</center>
</body>
</html>