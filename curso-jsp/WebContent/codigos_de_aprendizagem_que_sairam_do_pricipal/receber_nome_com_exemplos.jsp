<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%="Nome recebido: " + request.getParameter("nome")%>

	<!-- Criando vari�veis -->
	<%!int cont = 2;%>
	<!--  -->
	<%=cont%>

	<!-- Ao abrir a p�gina redireciona para a p�gina do UOL -->
	<%
	response.sendRedirect("http://uol.com.br");
	%>


	<!-- Recuperar dados de uma sess�o -->
	<%=session.getAttribute("curso")%>	
	
	<%@ page isErrorPage="true" %>	
	<%= exception %>
	
</body>
</html>