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
		<FONT size="7">�R���T�[�g�\��m�F���</FONT><br>
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
				<td><FONT size="5">�J�Ó���</FONT></td>
				<td><FONT size="5"><%=date%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">���</FONT></td>
				<td><FONT size="5"><%=place%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">���t��</FONT></td>
				<td><FONT size="5"><%=performer%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">�Ȗ�</FONT></td>
				<td><FONT size="5"><%=title%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">�Ȏ�</FONT></td>
				<td><FONT size="5"><%=rank%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">�l�i</FONT></td>
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
		<FONT size="5">��L�̓��e�ŗ\�񂵂܂����H</FONT><br>
		<br>
		<form method=post action="registConcert.jsp">
			<input type=submit name="registConcert_<%=concertID%>" value="�\��">
		</form>
		<%
			} else {
				session.setAttribute("concertID", concertID);
		%>
		<FONT size="5">���o�^���肪�Ƃ��������܂����D</FONT><br>
		<FONT size="5">�󒍃R�[�h��</FONT><br>
		<FONT size="5"><%=code%></FONT><br> <FONT size="5">�ł��D</FONT> 
		<br><br>
		<a href="./cancelConcert.jsp">�L�����Z���͂�����</a>
		<%
			}
		%>
		<br> <br> <a href="./concert.jsp">�z�[����</a>
	</center>
</body>
</html>