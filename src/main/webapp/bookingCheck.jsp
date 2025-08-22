<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
  <%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 확인</title>
<style>
body{font-family:Arial, sans-serif; text-align:center; background:#f0f0f0; padding-top:30px;}
table{margin:0 auto; border-collapse:collapse; width:80%;}
th, td{border:1px solid #000; padding:10px;}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<h2>예매 확인</h2>

<%
try{
    // TBL_BOOKING + TBL_MOVIE_2025 JOIN
    String sql = "SELECT b.bookingId, m.title, b.seat, b.customer, b.bookingDate " +
                 "FROM TBL_BOOKING b JOIN TBL_MOVIE_2025 m ON b.movieId = m.movieId " +
                 "ORDER BY b.bookingDate DESC"; // 최근 순서
    PreparedStatement pstmt = con.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
%>

<table>
<tr>
    <th>예매 번호</th>
    <th>영화 제목</th>
    <th>좌석 수</th>
    <th>예매자</th>
    <th>예매 일시</th>
</tr>
<%
    while(rs.next()){
%>
<tr>
    <td><%=rs.getInt("bookingId")%></td>
    <td><%=rs.getString("title")%></td>
    <td><%=rs.getInt("seat")%></td>
    <td><%=rs.getString("customer")%></td>
    <td><%=rs.getDate("bookingDate")%></td>
</tr>
<%
    }
} catch(Exception e){ e.printStackTrace(); }
%>
</table>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>