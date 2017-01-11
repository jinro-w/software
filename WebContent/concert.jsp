<%@ page language="java" contentType="text/html;charset=Shift_JIS"%>
<%@ page import="db.ConnectionManager"%>
<%@ page import="db.UserConnection"%>
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
		<FONT size="6"><a href="./userLogin.jsp"> ユーザログインはこちら</a></FONT>
	</Div>
	<center>
		<br> <br> <br> <br> <br>

		<%
			String userID = (String) session.getAttribute("userID");
			String userPasswd = (String) session.getAttribute("userPasswd");
			Boolean rogin = (Boolean) session.getAttribute("rogin");
			String userName;
			if (rogin == null || rogin == false) {
				userName = "ゲスト";
				session.removeAttribute("userID");
				session.removeAttribute("userPasswd");
			} else {
				userName = ConnectionManager.user().getName(userID, userPasswd);
			}
			out.println("<FONT size=\"6\">ようこそ，" + userName + "さん</FONT>");
		%>

		<br> <br>
		<form action="concert.jsp">
			<table border="2">
				<tr>
					<th>開催日時</th>
					<th>会場</th>
					<th>演奏者</th>
					<th>曲名</th>
					<th>席種</th>
					<th>料金</th>
					<th>空席情報</th>
					<th>予約はこちら</th>
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
										canRegist = "空席あり";
									} else {
								canRegist = "満席";
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
						value="予約可能"></td>
					<%
						} else {
					%>
					<td>予約不可</td>
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

		<br> <br> <a href="./concert.jsp">ホームへ</a>
	</center>
</body>
</html>