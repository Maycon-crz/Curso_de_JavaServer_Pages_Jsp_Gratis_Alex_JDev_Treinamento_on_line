<!-- Incluindo a class calcula / Para incluir a regra de negócio -->
<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
	
	<c:set var="numero" value="${100/2}"/>
		
	<c:if test="${numero == 50}">
		<c:redirect url="acessoliberado.jsp" />
	</c:if>
	
	<c:if test="${numero < 50}">
		<c:redirect url="https://www.javaavancado.com.br" />
	</c:if>	
		
	<p/>
	<p/>
	<p/>
	<p/>
	
		<form action="LoginServlet" method="post">
			Login:
			<input type="text" id="login" name="login">
			<br/>
			Senha:
			<input type="text" id="senha" name="senha">
			<br/>
			<input type="submit" value="Logar">
		</form>
		
	</body>
</html>