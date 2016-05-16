<%@ include file="../layout/cms_header.jsp"%>

<div class="row">
		<div class="col-xs-12 col-sm-6 cms_col3">
			<h4>Menu utente</h4>
			<ul class="nav navbar-nav navbar-left" >
			<li><a style="color:black;" href="/ArcheoDM" onclick="window.open(this.href);return false" title="ArcheoDM">
			           <span class="glyphicon glyphicon-edit"></span>home page</a></li>
            <li><a style="color:black;"  href="${pageContext.request.contextPath}/cmsmain"><span class="glyphicon glyphicon-edit"></span> Articoli</a></li>
            <li><a  style="color:black;" href="#"><span class="glyphicon glyphicon-edit"></span> Profilo utenti</a></li>
            <li><a  style="color:black;" href="#"><span class="glyphicon glyphicon-edit"></span> Categorie</a></li>
            <li><a  style="color:black;" href="#"><span class="glyphicon glyphicon-edit"></span> Assegna Menu</a></li>
             
           </ul>
		</div>
<!-- da qui finisce il template base -->

			<div class="col-xs-12 col-md-8 cms_col4">
				<h4>Articoli prodotti </h4> 
				<a href="${pageContext.request.contextPath}/addPost" class="btn btn-info">Nuovo</a><br>
            <table class="table table-striped" width="500px" style="margin-left:30px;">
            <thead>
	            <tr>
	            <th>Id</th>
	            <th>Titolo</th>
	            <th>Descrizione</th>
	            <th>Data Creazione</th>
	            <th>Autore</th>
	            <th>Azioni</th>
	            </tr>
          </thead>
        <tbody>
            <c:forEach items="${articoli}" var="posts">
            <tr>
                 <td>${posts.id}</td>
                 <td>${posts.title}</td>
                 <td>
                 < c:set var="string3" value="${fn:substring(posts.description, 0, 120)}" />
                  ${fn:replace(string3, "'", "\'")} ...
                 </td>
                 <td>${posts.created}</td>
                 <td>${posts.user_id}</td>
                 <td>
                 <a href="${pageContext.request.contextPath}/editPost/${posts.id}">Edit</a>
                 <a href="${pageContext.request.contextPath}/viewPost/${posts.id}">View</a>
                 <a href="${pageContext.request.contextPath}/deletePost/${posts.id}">Delete</a> 
                 </td>
             </tr>
               </c:forEach>
              </tbody>
           </table>
	</div>

<!-- da qui ricomincia il template -->		
</div>

<%@ include file="../layout/cms_footer.jsp" %>


