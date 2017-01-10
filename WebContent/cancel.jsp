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
<br>
<br>
<FONT size="6">以下の内容のツアーをキャンセル</FONT>
<br>
<br>
<%
String tourID = (String)session.getAttribute("tourID");
String userID = (String) session.getAttribute("userID");
String name = Conection.tour().getTourInfo(tourID, "name");
String price = Conection.tour().getTourInfo(tourID, "price");
%>
<table border = "2">
<tr><td><FONT size="5">プラン名</FONT></td><td><FONT size="5"><%= name%></FONT></td></tr>
<tr><td><FONT size="5">値段</FONT></td><td ><FONT size="5"><%= price%> 円</FONT></td></tr>
</table>
<%
if(request.getParameter(tourID)!=null){
Conection.tour().deleteTour(userID, tourID);
%><jsp:forward page="./alreadyCanceled.jsp" /><%
}
%>
<form method=post action = "cancelTour.jsp">
<input type = submit name = "<%= tourID %>" value = "キャンセルする">
</form>
</center>
</body>
</html>