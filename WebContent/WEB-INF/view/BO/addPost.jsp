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


<div class="form-container" style="margin: 0 auto;margin-top:15px">
 	
 	<h1>Aggiungi un nuovo articolo</h1>
 	<!--  se non definito nel form il campo action, la form ritorna al metodo del controller che l'ha generata  -->
	

   <form:form method="POST" modelAttribute="newpost">
    
      <div class="form-group">

            <label for="title">Titolo</label>

            <input type="text" class="form-control" id="title" name="title" placeholder="title">
            <form:errors path="title" class="control-label" />
        </div>
        
        <div class="form-group">

            <label for="title">Immagine</label>

            <input type="text" class="form-control" id="image" name="image" placeholder="immagine">
            <form:errors path="image" class="control-label" />
        </div>

        <div class="form-group">

            <label for="category">Categoria</label>

           <select name="category"> 
           <c:forEach items="${categories}" var="cat"> 
				  <option value="${cat}">${cat}</option>
			 </c:forEach>	  
				</select> 
            <form:errors path="category" class="control-label" />            

        </div>

        <div class="form-group">
           <input type="hidden" name="user_id" value="${username}">
            <label for="description">Descrizione</label>

            <textarea rows="4" cols="50" class="form-control" id="description" name="description" placeholder="description">
            </textarea>
          <form:errors path="description" class="control-label" />
        </div>


        <button type="submit" class="btn btn-primary">Salva</button>

    </form:form>

	
	
	
	 


<!-- da qui ricomincia il template -->		
</div>

<%@ include file="../layout/cms_footer.jsp" %>