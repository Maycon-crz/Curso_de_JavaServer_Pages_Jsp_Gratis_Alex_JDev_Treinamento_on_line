<!-- Incluindo a class calcula / Para incluir a regra de negócio -->
<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="myprefix" uri="../WEB-INF/testetag.tld" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- * é todos os atributos do objeto calcula -->
		<jsp:setProperty property="*" name="calcula"/>
		<h3>Cabecalho</h3>
		Nome: ${param.nome}
		<br/>
		Ano: ${param.ano}
		<br/>
		${sessionScope.user}
	</body>
</html>