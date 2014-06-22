<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${param.title}</title>
</head>
<body>
  <c:import url="/WEB-INF/jsp/common/header.jsp"></c:import>
  <c:import url="/WEB-INF/jsp/common/navigation.jsp"></c:import>
  
  <div>
  ${param.contents}
  </div>
  
  <div>
    <c:if test="${not empty param.tmplNumber}">
      <c:import url="/WEB-INF/jsp/templates/switch_tmpl.jsp">
        <c:param name="number" value="${param.tmplNumber}"/>
      </c:import>
    </c:if>
  </div>
  
  <c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
</body>
</html>