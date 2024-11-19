<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>


<%-- 디비로부터 값 받아오는 라이브러리(디비에서 주는 값을 번역해줌) --%>
<%@ page import="java.sql.ResultSet" %>



<%-- 벡엔드 통신 --%>

<% 
// jsp 문법을 적을 수 있는 공간(문장 끝마다 세미콜론; 필수!)


// DB 통신


Class.forName("org.mariadb.jdbc.Driver");

Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234"); // db에 연결하는 부분(디비의 ip주소)


String sql = "SELECT id, pw FROM account"; // SQL을 만들어주는 라이브러리

PreparedStatement query = connect.prepareStatement(sql);


// Query 전송(SQL 전송) //// 
ResultSet result = query.executeQuery();

// n번째 로우에 접근할 수 있게 하려면 아래처럼 반복해야함
// result.next()
// result.next()
// result.next()


// 테이블에 존재하는 로우의 개수만큼 화면에 반복 출력하기
// 그동안은 js의 createElement로 html 중복코드를 해결했었음(반복횟수를 아는 상태)
// -> 모든 페이지에 들어가는 헤더나 어사이드등에 ㅆ임


// 우리는 jsp 스파게티 코드로 해결할 것임

%>

<%-- 프론트엔드 레이아웃(위 데이터를 사용한) --%>


<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>week77</title>
</head>

<body>
<%-- // 백엔드 변수를 프론트로 가져오는 방법 --%>

<h1>회원 목록</h1>

<%-- jsp문법 넣어주기 --%>
<% while(result.next()) {  %>
<%-- 로우의 갯수만큼 {}를 반복 --%>

<div>
  <span><%=result.getString("id")%><span>
  <span><%=result.getString("pw")%><span>
</div>

<% } %>

</body>