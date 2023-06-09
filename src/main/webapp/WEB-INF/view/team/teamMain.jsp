<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>함께 상담센터</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
  <h3>1. 모든 팀 정보 조회하기</h3>
  <button onclick="location.href='${pageContext.servletContext.contextPath}/team/list'">전체 정보 조회하기</button>

  <hr>

  <h3>2. 상담자가 가장 많이 포진한 팀 순서로 조회하기</h3>
  <button onclick="location.href='${pageContext.servletContext.contextPath}/team/sortList'">순서대로 정보 조회하기</button>

  <hr>

  <h3>3. 신규 팀 추가히기</h3>
    팀 이름 : <input type="text" name="name" id="name"><br>
    소속 상세 정보 : <input type="text" name="detail" id="detail"><br>
    사용 여부
    <select name="use" id="use">
      <option value="Y">사용 중</option>
      <option value="N">비사용 중</option>
    </select><br>
    <button type="submit" id="sendButton">팀 정보 등록하기</button>

      <script>
          $("#sendButton").click(function () {
            const name = document.getElementById("name").value;
            const detail = document.getElementById("detail").value;
            const use = document.getElementById("use").value;

            const team = { name: name,
              detail: detail,
              use: use
            };

        $.ajax({
          url: "/team/insert",
          type: "get",
          data : team,
          success: function(data, textStatus, xhr) {
              alert("신규 팀 등록에 성공하셨습니다!");
          },
          error: function(xhr, status, error) {
              alert(error);
          }
        })

        });
      </script>
  <hr>

  <h3>4. 기존 팀 정보 수정하기</h3>
  <form action="${ pageContext.servletContext.contextPath }team/update" method="post">
    수정할 팀 코드를 입력해주세요 : <input type="text" name="teamCode"><br>
    <h4>수정할 정보를 입력해주세요</h4>
    팀 이름 : <input type="text" name="name"><br>
    팀 상세 정보 : <input type="text" name="detail"><br>
    팀 사용 여부
    <select name="use">
      <option value="U">변경 안 함</option>
      <option value="Y">사용 중</option>
      <option value="N">비사용 중</option>
    </select><br>
    <button type="submit">팀 정보 수정하기</button>
  </form>
  <hr>

  <h3>5. 기존 팀 정보 삭제하기</h3>
  <form action="team/delete">
    삭제할 팀 코드를 입력해주세요 : <input type="text" name="teamCode"><br>
    <button type="submit">팀 정보 삭제하기</button>
  </form>
</body>
</html>
