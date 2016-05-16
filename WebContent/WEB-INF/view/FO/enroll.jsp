<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>user Enrollment Form</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/custom.css' />" rel="stylesheet"></link>
</head>

<body>
   
      
 	<div class="form-container" style="margin: 0 auto;margin-top:15px">
 	
 	<h1>Register Form</h1>
 	<!--  se non definito nel form il campo action, la form ritorna al metodo del controller che l'ha generata  -->
	<form:form method="POST" modelAttribute="users" class="form-horizontal">

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="nome">Nome</label>
				<div class="col-md-7">
					<form:input type="text" path="nome" id="nome" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="nome" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="cognome">Cognome</label>
				<div class="col-md-7">
					<form:input type="text" path="cognome" id="cognome" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="cognome" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="email">Email</label>
				<div class="col-md-7">
					<form:input type="text" path="email" id="email" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="email" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

      <div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="email">Indirizzo</label>
				<div class="col-md-7">
					<form:input type="text" path="email" id="indirizzo" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="indirizzo" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		


		<div class="row">
			<div class="form-actions floatRight">
				<input type="submit" value="register" class="btn btn-primary btn-sm">
			</div>
		</div>
	</form:form>
	</div>
	
</body>
</html>