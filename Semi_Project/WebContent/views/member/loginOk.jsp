<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>'
    
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
	
<script>
	setTimeout(function() {
		opener.location.reload();
		self.close();
	},500);
	
	var msg = "<%= alertMsg %>";
	
	if(msg != "null") { 
		alert(msg);
	
		<% session.removeAttribute("alertMsg"); %>
	}

</script>

</html>