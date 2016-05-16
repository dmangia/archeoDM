<%@ include file="../layout/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container" style="margin-top:20px">
<div class="panel panel-default">
<div class="panel-heading">
   <h3>${articolo.title}</h3>
</div>
<div class="panel-body">
<img src="${articolo.image}"  style="float:left;width:200px;margin:10px">
${fn:replace(articolo.description, "'", "\'")}</div>
	<div class="panel-footer">Data creazione: ${articolo.created}
  </div>
</div>
</div>

<%@ include file="../layout/footer.jsp" %>