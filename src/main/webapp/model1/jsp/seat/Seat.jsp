<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.seat-table tr td:hover:not(.border0){
	background-color : gray;
}
.border0 {
	border: 0px !important;
}

</style>
<script>
function alertFunc(elem){
	var str = "SEAT"
	alert(str.concat(lpad(elem.innerText,4,0)));
}
function lpad(val, padLength, padString){
    while(val.length < padLength){
        val = padString + val;
    }
    return val;
}
</script>
</head>
<body>
	<%@ include file="../inc/Header_inc.jsp"%>
	<%@ include file="../inc/Header.jsp"%>

	<%
	String[] strArr = new String[20];
	for (int i = 0; i < strArr.length; i++) {
		strArr[i] = Integer.toString(i + 1);
	}
	int trCnt = strArr.length / 4;
	%>
	<div class="container mt-3">
		<table class="table seat-table">
		<%
		int leftTd=0, rightTd=10;
		for(int i=1 ; i<=trCnt ; i++){			 
		%>
			<tr>
				<td onclick='alertFunc(this);'><%=strArr[leftTd]%></td>
				<td onclick=alertFunc(this);><%=strArr[++leftTd]%></td>
				<td class="border0"></td>
				<td onclick=alertFunc(this);><%=strArr[rightTd]%></td>
				<td onclick=alertFunc(this);><%=strArr[++rightTd]%></td>
			</tr>
		<%
			leftTd++;
			rightTd++;
		}
		%>
			
		</table>
	</div>
</body>
</html>