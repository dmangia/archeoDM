<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>ArcheoDM</title>
 <meta charset="utf-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link href="<c:url value='/static/css/custom.css' />" rel="stylesheet"></link>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid" style="margin:10px;">
	<div class="row">
		<div class="col-xs-12 col-sm-8 cms_col1">
		<h3><span class="glyphicon glyphicon-fire"></span> ${title}  
		  <span style="background:coral;color:green;font-size:18px"> Benvenuto ${username} </span><span class= "glyphicon glyphicon-pushpin"></span> </h3>
		</div>
		<div class="col-xs-12 col-sm-4 cms_col2">
		   <ul class="nav navbar-nav navbar-right">
            <li><a class="cd-signin" href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
            <li><a class="cd-signup" href="#"><span class="glyphicon glyphicon-log-in"></span> Profilo utente</a></li>
           </ul>
		</div>
	</div>
	
		
