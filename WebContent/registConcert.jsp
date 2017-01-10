<%@ page language="java" contentType="text/html;charset=Shift_JIS"%>
<%@ page import="db.ConnectionManager"%>
<%@ page import="db.UserConnection"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<%
			String userID = (String) session.getAttribute("userID");
			String userPasswd = (String) session.getAttribute("userPasswd");
			Boolean rogin = (Boolean) session.getAttribute("rogin");
			if (rogin == null || rogin == false) {
		%><jsp:forward page="userLogin.jsp">
			<jsp:param name="previousPage" value="registConcert.jsp" />
		</jsp:forward>
		<%
			}
		%>
		<FONT size="7">コンサート予約確認画面</FONT><br>
		<br>
		<%
			String concertID = (String) session.getAttribute("concertID");
			String code = ConnectionManager.concert().getRegistCode(userID, concertID);
			String date = ConnectionManager.concert().getConcertInfo(concertID, "date");
			String place = ConnectionManager.concert().getConcertInfo(concertID, "place");
			String performer = ConnectionManager.concert().getConcertInfo(concertID, "performer");
			String title = ConnectionManager.concert().getConcertInfo(concertID, "title");
			String rank = ConnectionManager.concert().getConcertInfo(concertID, "rank");
			String price = ConnectionManager.concert().getConcertInfo(concertID, "price");
		%>
		<table border="2">
			<tr>
				<td><FONT size="5">開催日時</FONT></td>
				<td><FONT size="5"><%=date%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">会場</FONT></td>
				<td><FONT size="5"><%=place%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">演奏者</FONT></td>
				<td><FONT size="5"><%=performer%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">曲名</FONT></td>
				<td><FONT size="5"><%=title%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">席種</FONT></td>
				<td><FONT size="5"><%=rank%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">値段</FONT></td>
				<td><FONT size="5"><%=price%></FONT></td>
			</tr>
		</table>
		<%
			if (request.getParameter("registConcert_" + concertID) != null) {
				ConnectionManager.concert().registConcert(userID, concertID);
				code = ConnectionManager.concert().getRegistCode(userID, concertID);
			}
		%>
		<%
			if (!ConnectionManager.concert().getUserConcerts(userID).contains(concertID)) {
		%>
		<FONT size="5">上記の内容で予約しますか？</FONT><br>
		<br>
		<form method=post action="registConcert.jsp">
			<input type=submit name="registConcert_<%=concertID%>" value="予約">
		</form>
		<%
			} else {
				session.setAttribute("concertID", concertID);
		%>
		<FONT size="5">ご登録ありがとうございました．</FONT><br>
		<FONT size="5">受注コードは</FONT><br>
		<FONT size="5"><%=code%></FONT><br> <FONT size="5">です．</FONT> 
		<br><br>
		<a href="./cancelConcert.jsp">キャンセルはこちら</a>
		<%
			}
		%>
		<br> <br> <a href="./concert.jsp">ホームへ</a>
	</center>
</body>
</html>