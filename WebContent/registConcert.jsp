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
<FONT size="7">ツアー予約確認画面</FONT><br><br>
<%
String concertID = (String)session.getAttribute("concertID");
String name = Conection.concert().getConcertInfo(concertID, "name");
String price = Conection.concert().getConcertInfo(concertID, "price");
%>
<table border = "2">
<tr><td><FONT size="5">プラン名</FONT></td><td><FONT size="5"><%= name%></FONT></td></tr>
<tr><td><FONT size="5">値段</FONT></td><td ><FONT size="5"><%= price%> 円</FONT></td></tr>
</table>
<%
if(request.getParameter(concertID) != null){
Conection.concert().registConcert(userID, concertID);
}
%>
<%
if(!Conection.concert().getUserConcerts(userID).contains(concertID)){ %>
<FONT size="5">上記の内容で予約しますか？</FONT><br><br>
<form method=post action = "registConcert.jsp">
<input type = submit name = "<%= concertID %>" value = "予約">
</form>
<%}else{
session.setAttribute("concertID", concertID);
%>
<FONT size="5">ご登録ありがとうございました．</FONT><br><br>
<a href="./concertDetail.jsp"> 予約内容確認画面</a><br><br>
<%}
%>
<br><br>
<a href="./concert.jsp">ホームへ</a>
</center>
</body>
</html>