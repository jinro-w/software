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
		
		<br> <br> <FONT size="6">�ȉ��̏��œo�^���܂���</FONT> <br><br>
		
		<table border="2">
			<tr>
				<td><FONT size="5">���[�UID</FONT></td>
				<td><FONT size="5"><%=userID%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">����</FONT></td>
				<td><FONT size="5"><%=name%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">�p�X���[�h</FONT></td>
				<td><FONT size="5"><%=passwd%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">�Z��</FONT></td>
				<td><FONT size="5"><%=adress%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">�d�b�ԍ�</FONT></td>
				<td><FONT size="5"><%=phone%></FONT></td>
			</tr>
			<tr>
				<td><FONT size="5">���[���A�h���X</FONT></td>
				<td><FONT size="5"><%=email%></FONT></td>
			</tr>
		</table>
		<br>
		
		<%
		}else{
		%>

		<br> <br> <br> <br> <br> <br> <FONT
			size="6">���[�U������͂��Ă�������</FONT> <br> <br> <br>
		<form method=post action="newAccount.jsp">
			���[�UID:<input type="text" name="userID"><br> 
			����:<input type="text" name="name"><br> 
			�p�X���[�h:<input type=password name="passwd" size=16 maxlength=12><br> 
			�Z��:<input type="text" name="adress"><br> 
			�d�b�ԍ�:<input type="text" name="phone"><br> 
			���[���A�h���X:<input type="text" name="email"><br> 
			<input type="submit" name="newAccount" value="�o�^����"></input>
		</form>

		<%
		}
		%>

		<p>
			<a href="./concert.jsp">�z�[���֖߂�</a>
		</p>
	</center>
</body>
</html>