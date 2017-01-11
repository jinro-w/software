<%@ page language="java" contentType="text/html;charset=Shift_JIS"%>
<%@ page import="db.ConnectionManager"%>
<%@ page import="db.UserConnection"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�R���T�[�g�ꗗ</title>
</head>
<body>
	<br>
	<br>
	<br>
	<Div Align="right">
		<FONT size="6"><a href="./userLogin.jsp"> ���[�U���O�C���͂�����</a></FONT>
	</Div>
	<center>
		<br> <br> <br> <br> <br>

		<%
			String userID = (String) session.getAttribute("userID");
			String userPasswd = (String) session.getAttribute("userPasswd");
			Boolean rogin = (Boolean) session.getAttribute("rogin");
			String userName;
			if (rogin == null || rogin == false) {
				userName = "�Q�X�g";
				session.removeAttribute("userID");
				session.removeAttribute("userPasswd");
			} else {
				userName = ConnectionManager.user().getName(userID, userPasswd);
			}
			out.println("<FONT size=\"6\">�悤�����C" + userName + "����</FONT>");
		%>

		<br> <br>
		<form action="concert.jsp">
			<table border="2">
				<tr>
					<th>�J�Ó���</th>
					<th>���</th>
					<th>���t��</th>
					<th>�Ȗ�</th>
					<th>�Ȏ�</th>
					<th>����</th>
					<th>��ȏ��</th>
					<th>�\��͂�����</th>
				</tr>

				<%
				for (int i = 0; i < 3; i++) {
					String date = ConnectionManager.concert().getConcertInfo(String.valueOf(1 + 5 * i), "date");
					String place = ConnectionManager.concert().getConcertInfo(String.valueOf(1 + 5 * i), "place");
					String performer = ConnectionManager.concert().getConcertInfo(String.valueOf(1 + 5 * i), "performer");
					String title = ConnectionManager.concert().getConcertInfo(String.valueOf(1 + 5 * i), "title");
			%>

				<tr>
					<td rowspan=5><%=date%></td>
					<td rowspan=5><%=place%></td>
					<td rowspan=5><%=performer%></td>
					<td rowspan=5><%=title%></td>
					<%
					for (int j = 1 + 5 * i; j <= 5 + 5 * i; j++) {
									String rank = ConnectionManager.concert().getConcertInfo(String.valueOf(j), "rank");
									String price = ConnectionManager.concert().getConcertInfo(String.valueOf(j), "price");
									String canRegist;
									boolean registFrag = true;
									if (ConnectionManager.concert().canRegistConcert(String.valueOf(j))) {
										canRegist = "��Ȃ���";
									} else {
								canRegist = "����";
								registFrag = false;
							}
				%>
					<td><%=rank%></td>
					<td><%=price%></td>
					<td><%=canRegist%></td>
					<%
						if (registFrag) {
					%>
					<td><input type=submit name="concert_<%=String.valueOf(j)%>"
						value="�\��\"></td>
					<%
						} else {
					%>
					<td>�\��s��</td>
					<%
						}
					%>
				</tr>

				<%
					}
					}
				%>

				<%
					for (int i = 1; i <= 15; i++) {
						if (request.getParameter("concert_" + String.valueOf(i)) != null) {
							session.setAttribute("concertID", String.valueOf(i));
				%>
				<jsp:forward page="registConcert.jsp">
					<jsp:param name="concertID" value="<%=i%>" />
				</jsp:forward>
				<%
					}
					}
				%>
			</table>
		</form>

		<br> <br> <a href="./concert.jsp">�z�[����</a>
	</center>
</body>
</html>