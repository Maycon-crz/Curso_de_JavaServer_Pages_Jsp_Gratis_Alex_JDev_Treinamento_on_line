<!-- Incluindo a class calcula / Para incluir a regra de negócio -->
<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Index</h1>
		<br/>
		
		<form action="cabecalho.jsp" method="post">
		
			<% session.setAttribute("user", "javaavancado"); %>
		
			<input type="text" id="nome" name="nome">
			<br/>
			<input type="text" id="ano" name="ano">
			<br/>
			<input type="submit" value="testar"/>
		</form>
		
		<hr/>
		<!-- Chama método que foi importado/incluido usando jsp lá em cima -->
		<%= calcula.calcula(50) %>
		
	</body>
</html>