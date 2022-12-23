<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.seat-table tr td {
	border: 1px solid black;
	width: 100px;
	height: 100px;
	text-align: center;
}
			.border0 {
				border: 0px !important;
			}
</style>
<script>
function alertFunc(elem){
	alert(elem.innerText);
}
</script>
</head>
<body>
	<%@ include file="../inc/Header_inc.jsp"%>
	<%@ include file="../inc/Header.jsp"%>
	
	<%
	String [] strArr= new String[20];
	for(int i = 0 ; i<strArr.length; i++){
		strArr[i] = Integer.toString(i+1);
	}
	%>
	<div class="container mt-3">
	<table class="seat-table">
		<tr>
			<td onclick=alertFunc(this);><%=strArr[0]%></td>
			<td onclick=alertFunc(this);><%=strArr[1]%></td>
			<td class="border0"></td>
			<td onclick=alertFunc(this);><%=strArr[10]%></td>
			<td onclick=alertFunc(this);><%=strArr[11]%></td>
		</tr>
		<tr>
			<td onclick=alertFunc(this);><%=strArr[2]%></td>
			<td onclick=alertFunc(this);><%=strArr[3]%></td>
			<td class="border0"></td>
			<td onclick=alertFunc(this);><%=strArr[12]%></td>
			<td onclick=alertFunc(this);><%=strArr[13]%></td>
		</tr>
		<tr>
			<td onclick=alertFunc(this);><%=strArr[4]%></td>
			<td onclick=alertFunc(this);><%=strArr[5]%></td>
			<td class="border0"></td>
			<td onclick=alertFunc(this);><%=strArr[14]%></td>
			<td onclick=alertFunc(this);><%=strArr[15]%></td>
		</tr>
		<tr>
			<td onclick=alertFunc(this);><%=strArr[6]%></td>
			<td onclick=alertFunc(this);><%=strArr[7]%></td>
			<td class="border0"></td>
			<td onclick=alertFunc(this);><%=strArr[16]%></td>
			<td onclick=alertFunc(this);><%=strArr[17]%></td>
		</tr>
		<tr>
			<td onclick=alertFunc(this);><%= strArr[8]%></td>
			<td onclick=alertFunc(this);><%= strArr[9]%></td>
			<td class="border0"></td>
			<td onclick=alertFunc(this);><%= strArr[18]%></td>
			<td onclick=alertFunc(this);><%= strArr[19]%></td>
		</tr>
	</table>
</div>
</body>
</html>