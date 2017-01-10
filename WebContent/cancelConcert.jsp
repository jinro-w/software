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
		<br> <br> <FONT size="6">以下の内容のコンサートをキャンセル</FONT> <br>
		<br>
		<%
			String userID = (String) session.getAttribute("userID");
			String concertID = (String) session.getAttribute("concertID");
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
		<br>

		<%
			if (request.getParameter("cancelConcert_" + concertID) != null) {
				ConnectionManager.concert().deleteConcert(userID, concertID);
			}

		if (ConnectionManager.concert().getUserConcerts(userID).contains(concertID)) {
		%>
		<form method=post action="cancelConcert.jsp">
			<input type=submit name="cancelConcert_<%=concertID%>"
				value="キャンセルする">
		</form>
		<%
		}else{
			out.println("キャンセルしました．");
		}
		%>
		<br> <br> <a href="./concert.jsp">ホームへ</a>
	</center>
</body>
</html>