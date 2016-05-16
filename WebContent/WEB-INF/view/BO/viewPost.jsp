<%@ include file="../layout/cms_header.jsp"%>


<div class="row">
		<div class="col-xs-12 col-sm-6 cms_col3">
			<h4>Menu utente</h4>
			<ul class="nav navbar-nav navbar-left" >
            <li><a style="color:black;"  href="${pageContext.request.contextPath}/cmsmain"><span class="glyphicon glyphicon-edit"></span> Articoli</a></li>
            <li><a  style="color:black;" href="#"><span class="glyphicon glyphicon-edit"></span> Profilo utenti</a></li>
            <li><a  style="color:black;" href="#"><span class="glyphicon glyphicon-edit"></span> Categorie</a></li>
            <li><a  style="color:black;" href="#"><span class="glyphicon glyphicon-edit"></span> Assegna Menu</a></li>
           </ul>
		</div>
<!-- da qui finisce il template base -->

		<div class="col-xs-12 col-md-8 " style="margin-top: 15px;">
		<div class="panel panel-default">
		<div class="panel-heading">
		   <h3>${articolo.title}</h3>
		</div>
		<div class="panel-body">
		<img src="${articolo.image}"  style="float:left;width:200px;margin:10px">
		       ${articolo.description}</div>
			<div class="panel-footer">Data creazione: ${articolo.created}
		  </div>
		</div>
		</div>


<!-- da qui ricomincia il template -->		
</div>

<%@ include file="../layout/cms_footer.jsp" %>