<%-- : html에서 !Doctype html과 같은 역할. 복붙해서 다른 프로젝트에서도 쓰기! 모든 jsp파일은 이 코드로 시작함 --%>
<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>week77</title>
</head>
  <body>

    <h1>week77 프로젝트 메인 페이지</h1>

    아이디<input type="text" id="id_value">
    비밀번호<input type="password" id="pw_value">
    이름<input type="text" id="name_value">

    <input type="button" value="회원가입" onclick="signupEvent()">
    <input type="button" value="회원 목록 페이지" onclick="moveAccountPageEvent()">

    <script>
      function signupEvent() {
        // 인풋값 가져오기

        // id로 변수에 담아오게 만들어줌
        var idValue = document.getElementById("id_value").value;
        var pwValue = document.getElementById("pw_value").value;
        var nameValue = document.getElementById("name_value").value;

        // 자바스크립트에서 페이지 이동하면서 값을 같이 넘겨주는 방법 -> 이 방법 외에 form태그를 쓰는 방법도 있음.
        // 쿼리 : url에 값을 넣어줄 수 있음(id=변수명, &는 여러개 넣어줄 때)
        // ? : 물음표 다음은 쿼리이다
        // id, pw : 키
        location.href = "./signupAction.jsp?id=" + idValue + "&pw=" + pwValue + "&name=" + nameValue


      }
      function moveAccountPageEvent() {
        location.href = "./accountListPage.jsp"
      }
    </script>
  </body>

