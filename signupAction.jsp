<%-- : html에서 !Doctype과 같은 역할. 복붙해서 다른 프로젝트에서도 쓰기! --%>
<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 자바 언어로 된 라이브러리가 많음. 디비통신도 라이브러리가 해줌 --%>

<%-- 커넥터 파일을 찾아오는 라이브러리(mariadb 찾는 라이브러리) --%>
<%-- 데이터베이스 탐색 라이브러리 --%>
<%@ page import="java.sql.DriverManager" %>
<%-- DB에 연결하는 라이브러리(서버와 디비서버 연걸) --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL을 만들어주는 라이브러리(SQL 준비 및 전송 라이브러리) --%>
<%@ page import="java.sql.PreparedStatement" %>




<%-- 벡엔드 통신 --%>

<% 
// jsp 문법을 적을 수 있는 공간(문장 끝마다 세미콜론; 필수!)

// 값을 받아올 때 jsp문법이 필요함

  request.setCharacterEncoding("utf-8");
  // request jsp 명령어(앞페이지에서 넘어온 모든 요청)
  // 앞페이지에서 받아온 값(문자)에 대한 인코딩 설정을 utf-8로 설정(utf-8로 설정해주지 않으면 유티코드로 자동으로  되는데 그럼 한글이 깨짐)
  // 이전페이지에서 값을 보내면 무조건 쓰고 값을 안보내면 안써도 됨

  // 값 받아오기(변수 만들어서)
  // String 타입의 idValue 변수를 만들겠다
  String idValue = request.getParameter("id");
  String pwValue = request.getParameter("pw");
  String nameValue = request.getParameter("name");
  // request : 이전 페이지의 요청
  // getParameter(키) : 
  // 키 : id= + idValue 에서 id를 가져옴
  // request.getParameter() : 이전 페이지의 변수를 받겠다("키")






// DB 코드(라이브러리 쓸거임: 위에서 임포트 해야함) 통신

// DB Connect 찾아오기(커넥터파일 찾아오기)
// 에러가 나는 원인들 : 커넥터파일이 없음(설치안함) / 디비를 설치하지 않았음 / 디비 서버가 꺼져있음
// 마리아디비 커넥터의 
Class.forName("org.mariadb.jdbc.Driver");
// 커넥터를 찾아오는 부분(에러 : 커넥터 파일이 잘못됐거나, 디비 서버가 꺼져있거나, 디비가 설치가 안됐거나 등 디비 관련된 문제임)

// DB 서버에 연결
Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234"); // db에 연결하는 부분(디비의 ip주소)
// () 안 매개변수 : 디비 서버 주소, 계정 아이디, 계정 비번
// jdbc:mariadb://localhost ->  : localhost데이터베이스 서버의 ip 주소(우ㅜ리는 서버 안에 디비서버가 있으므로 ip안적고 localhost해도 됨 )
// 3306 : 마리아디비 포트 번호
// web : 사용할 디비 이름

// SQL 작성
String sql = "INSERT INTO account (id, pw) VALUES (?, ?)"; // SQL을 만들어주는 라이브러리
// SQL 인젝션으로 검색?
// VALUE() 안에 "+idValue+", "+pwValue+"로 스트링처리 해주기 대신 ?로 편리하고 안전하게 하기
// id, pw : 디비의 컬럼명

// SQL 전송 준비 상태로 만들기
PreparedStatement query = connect.prepareStatement(sql);
// 여기서의 쿼리 : 전송 준비 상태인 sql(명령어 덩어리)

// 쿼리 준비
// ?를 채워주기
query.setString(1, idValue); // ? 첫번째에 idValue 넣어줄것이다. 1번째 물음표에 idValue를 넣어줄 것이다.
query.setString(2, pwValue);

// Query 전송(SQL 전송) ////
query.executeUpdate();



%>

<%-- 프론트엔드 레이아웃(위 데이터를 사용한) --%>


<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>week77</title>
</head>

<body>
<%-- // 백엔드 변수를 프론트로 가져오는 방법 --%>

<h1>아이디 : <%=idValue%></h1>

<%-- // <%=idValue%> : jsp idValu변수를 갖다 쓰겠다 --%>
<%-- // 백엔드에서 만든 변수를 프론트로 넘기면 raw 데이터가 넘어감. (string이 아닌 가공되지 않은 값 자체. 아이디에 a를 넣으면 스트링 "a"가 아니라 a가 그대로 들어가서 변수처럼 취급됨. 따라서 ""를 반드시 넣어줘야 함! ) --%>
<%-- 숫자를 console.log로 출력하면 String이아니라 integer로 취급이되어서 문제없이 돌아감. console.log(1) 요런건 에러 없이 잘 돌아가는거랑 같음 --%>
<%-- console.log(1) 이건 1을 출력하라는 의미

console.log(test) 이건 test라는 변수를 출력하라는 의미 --%>
<script>
  console.log("<%=idValue%>")
  console.log(<%=pwValue%>)
  alert("성공")
  location.href = "./index.jsp"
</script>
</body>