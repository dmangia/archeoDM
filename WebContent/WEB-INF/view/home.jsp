
<%@ include file="layout/header.jsp" %>


<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
     width:70%;
      height: 300px;
      margin: auto;
  }
  </style>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="<spring:url value="/static/cnosso.jpg" />" alt="Chania">
    </div>

    <div class="item">
      <img src="<spring:url value="/static/magnagrecia.jpg" />" alt="Chania2">
    </div>

    <div class="item">
      <img src="<spring:url value="/static/selinunte.jpg" />" alt="piana">
    </div>

    <div class="item">
      <img src="<spring:url value="/static/archeologi.jpg" />" alt="archeologi">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

 
 

 <!-- content body -->
 <section>
		<div class="jumbotron" style="height:100px">
			<div class="container" >
				<h3>${category}</h3>
			</div>
		</div>
	</section>

	<section class="container">
		<div class="row">
			<c:forEach items="${articoli}" var="posts">
				<div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
					<div class="thumbnail">
						<div class="caption">
							<h4 style="color:blue">${posts.title}</h4>
							<c:set var="string2" value="${fn:substring(posts.description, 0, 120)}" />
							<p>${fn:replace(string2, "'", "\'")} ...</p>
							<a href="${pageContext.request.contextPath}/dettaglio/${posts.id}" class="btn btn-info">Approfondisci</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
  
<br>
  
  
<%@ include file="layout/footer.jsp" %>
