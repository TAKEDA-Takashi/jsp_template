<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>JSPをテンプレート化して使う2</title>
</head>
<body>
  <c:import url="/WEB-INF/jsp/common/header.jsp"></c:import>
  <c:import url="/WEB-INF/jsp/common/navigation.jsp"></c:import>
  
  <div>
  メインコンテンツ。
  </div>
  
  <c:import url="/WEB-INF/jsp/side_bar.jsp">
    <c:param name="pageName">main2.jsp</c:param>
  </c:import>
  <c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
</body>
</html>