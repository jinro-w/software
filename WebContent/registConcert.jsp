<%@ page language="java" contentType="text/html;charset=Shift_JIS"%>
<%@ page import = "sample.Conection"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<br><br><br><br><br><br>
<% String userID = (String) session.getAttribute("userID");
String userPasswd = (String) session.getAttribute("userPasswd");
Boolean rogin = (Boolean) session.getAttribute("rogin");
String userName ;
if(rogin == null || rogin == false){
%><jsp:forward page="userLogin.jsp">
<jsp:param name = "previousPage" value = "registTour.jsp" />
</jsp:forward><%
}
%>
<FONT size="7">�c�A�[�\��m�F���</FONT><br><br>
<%
String concertID = (String)session.getAttribute("concertID");
String name = Conection.concert().getConcertInfo(concertID, "name");
String price = Conection.concert().getConcertInfo(concertID, "price");
%>
<table border = "2">
<tr><td><FONT size="5">�v������</FONT></td><td><FONT size="5"><%= name%></FONT></td></tr>
<tr><td><FONT size="5">�l�i</FONT></td><td ><FONT size="5"><%= price%> �~</FONT></td></tr>
</table>
<%
if(request.getParameter(concertID) != null){
Conection.concert().registConcert(userID, concertID);
}
%>
<%
if(!Conection.concert().getUserConcerts(userID).contains(concertID)){ %>
<FONT size="5">��L�̓��e�ŗ\�񂵂܂����H</FONT><br><br>
<form method=post action = "registConcert.jsp">
<input type = submit name = "<%= concertID %>" value = "�\��">
</form>
<%}else{
session.setAttribute("concertID", concertID);
%>
<FONT size="5">���o�^���肪�Ƃ��������܂����D</FONT><br><br>
<a href="./concertDetail.jsp"> �\����e�m�F���</a><br><br>
<%}
%>
<br><br>
<a href="./concert.jsp">�z�[����</a>
</center>
</body>
</html>