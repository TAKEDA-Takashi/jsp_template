<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>読み込むテンプレートを切り替える</title>
</head>
<body>
  <c:choose>
    <c:when test="${param.flag == 1}">
      <c:import url="/WEB-INF/jsp/templates/tmpl1.jsp"/>
    </c:when>
    <c:otherwise>
      <c:import url="/WEB-INF/jsp/templates/tmpl2.jsp"/>
    </c:otherwise>
  </c:choose>
  
  <%--
  ちなみに
  <c:import url="/WEB-INF/jsp/templates/${param.name}.jsp"/>
  のように、読み込むパスに変数を含めることも可能だが、
  ディレクトリトラバーサル対策は必須。
  --%>
</body>
</html>