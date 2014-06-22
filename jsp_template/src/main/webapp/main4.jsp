<% pageContext.setAttribute("tmplNumber", (int) (Math.random() * 2) + 1); %>
<c:import url="/WEB-INF/jsp/layout.jsp">
  <c:param name="title">レイアウトを用意する</c:param>
  <c:param name="contents">
    <p>コンテンツコンテンツコンテンツコンテンツ</p>
  </c:param>
  <c:param name="tmplNumber" value="${tmplNumber}"/>
</c:import>