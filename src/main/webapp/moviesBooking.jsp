<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<title>영화 예매</title>
<style>
*{margin:0; padding:0;}
body{font-family:Arial, sans-serif;}
section{width:100%; height:calc(100vh - 130px); background:#f0f0f0; display:flex; flex-direction:column; align-items:center; justify-content:flex-start; padding-top:30px;}
form{background:#fff; padding:20px; border-radius:10px; box-shadow:0 0 10px rgba(0,0,0,0.2);}
input, select, button{margin:10px 0; padding:5px; width:200px;}
button{width:100px; cursor:pointer;}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<section>
<h2>영화 예매</h2>
<form action="bookingResult.jsp" method="post">
    <label>영화 선택:</label><br>
    <select name="movieId">
    <%
        try{
            String sql = "SELECT movieId, title FROM TBL_MOVIE_2025 ORDER BY movieId";
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
    %>
        <option value="<%=rs.getString("movieId")%>"><%=rs.getString("title")%></option>
    <%
            }
        }catch(Exception e){ e.printStackTrace(); }
    %>
    </select><br>
    
    <label>좌석 수:</label><br>
    <input type="number" name="seat" min="1" max="10" value="1"><br>
    
    <label>예매자 이름:</label><br>
    <input type="text" name="customer"><br>
    
    <button type="submit">예매</button>
</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>