<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
request.setCharacterEncoding("UTF-8"); // POST 파라미터 한글 처리
%>
<%
String movieId = request.getParameter("movieId");
String seat = request.getParameter("seat");
String customer = request.getParameter("customer");

request.setCharacterEncoding("UTF-8"); // POST 한글 처리

String movieTitle = "";
try{
    // 영화 제목 조회
    String sql = "SELECT title FROM TBL_MOVIE_2025 WHERE movieId=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, movieId);
    ResultSet rs = pstmt.executeQuery();
    if(rs.next()){
        movieTitle = rs.getString("title");
    }

    // 예매 테이블에 저장
    sql = "INSERT INTO TBL_BOOKING(bookingId, movieId, seat, customer) VALUES(SEQ_BOOKING_ID.NEXTVAL, ?, ?, ?)";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, movieId);
    pstmt.setInt(2, Integer.parseInt(seat));
    pstmt.setString(3, customer);
    pstmt.executeUpdate();

} catch(Exception e){
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 완료</title>
<style>
body{font-family:Arial, sans-serif; text-align:center; padding-top:50px;}
</style>
</head>
<body>
<h2>예매 완료 🎉</h2>
<p>영화: <strong><%=movieTitle%></strong></p>
<p>좌석 수: <strong><%=seat%></strong></p>
<p>예매자: <strong><%=customer%></strong></p>
<a href="listMovies.jsp">돌아가기</a>
</body>
</html>