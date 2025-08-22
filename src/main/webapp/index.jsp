<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트</title>
<style>
*{margin:0; padding:0;}
body{overflow:hidden; font-family:Arial, sans-serif;}
section{width:100%; height:calc(100vh - 130px); background-color: lightgray;}
section h2{padding:20px; text-align:center;}
div{display:flex; flex-direction:column; align-items:center; justify-content:flex-start; margin-top:20px;}
table{border-collapse:collapse; width:80%;}
table td, table th{border:1px solid #000; padding:10px; text-align:center;}
button{margin-top:20px; padding:10px 20px; font-size:16px; cursor:pointer;}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<section>
<h2>영화 정보 현황</h2>
<div>


<button onclick="location.href='moviesBooking.jsp'">예매 하기</button>
<button onclick="location.href='bookingCheck.jsp'">예매 확인</button>
</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
