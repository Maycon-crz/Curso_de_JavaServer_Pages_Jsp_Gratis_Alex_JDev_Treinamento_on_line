<!-- Incluindo a class calcula / Para incluir a regra de neg�cio -->
<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib prefix="myprefix" uri="../WEB-INF/testetag.tld" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Bem vindo ao curso de JSP</h1>		
		<%= "Seu sucesso garantido.." %>	
		
		<form action="receber-nome.jsp">
			<input type="text" id="nome" name="nome" />
			<input type="submit" value="Enviar" />
		</form>
		
		<!-- Criando vari�veis e m�todos na view, obs:n�o recomendado em um projeto real -->		
		<%! 			
			int cont = 2;
			
			public int retorna(int n){
				return n*3;
			}
		
		%>
		<!-- Imprimir uma vari�vel -->
		<%= cont %>
		
		<br/>
		
		<!-- Chamar um m�todo -->
		<%= retorna(8) %>
		
		<br/>
		
		<!-- Capturar dado de um xml -->
		<%= application.getInitParameter("estado") %>
		
		<!-- Criando uma vari�vel de sess�o que fica gravada independente de refresh -->
		<% /*session.setAttribute("curso", "curso de jsp")*/ %>
		
		<!-- 
			Este exemplo mostra como fazer uma din�mica para que quando ocorrer um erro
			na p�gina o usu�rio seja redirecionado para uma p�gina espec�fica neste caso a
			p�gina receber-nome.jsp;
		 -->
		<%@ page errorPage="receber-nome.jsp" %><!-- 2� Exemplo de diretivas -->		
		<%= 100/0 %><!-- Erro proposital para testar o redirecionamento para p�gina de erro -->
		
		<!-- Exemplo de directivas -->
		<%@ page import="java.util.Date" %>		
		<%= "data de hoje --> " + new Date() %>
				
		<!-- Forma de incluir partes externas -->
		<%@ include file="../pagina-include.jsp" %>
		
		<!-- Usando tag cutomizada -->
		<myprefix:minhatag/>
		
		<!-- Redirecionando e enviando parametro junto -->
		<jsp:forward page="receber-nome.jsp">
			<jsp:param value="site javaavancado.com" name="paramforward"/>
		</jsp:forward>
		
		<!-- Incluindo outros htmls no mesmo -->
		<jsp:include page="../cabecalho.jsp"/>
		<h3>fsdfsdfdsfsdfsdf</h3>
		<jsp:include page="../rodape.jsp"/>
		
		<!-- Recupera o atributo nome do objeto calcula, obs: Para isso funcionar � necess�rio ter importado l� em cima o <jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page" />   -->
		<jsp:getProperty property="nome" name="calcula"/>
		<br/>
		<jsp:getProperty property="ano" name="calcula"/>
		<br/>
		<jsp:getProperty property="sexo" name="calcula"/>
		
		<% session.setAttribute("user", "javaavancado"); %>
		
		<!--
		<form action="cabecalho.jsp" method="post">
			<input type="text" id="nome" name="nome">
			<br/>
			<input type="text" id="ano" name="ano">
			<br/>
			<input type="submit" value="testar"/>
		</form>
		-->
		
		<hr/>
		<!-- Chama m�todo que foi importado/incluido usando jsp l� em cima -->
		<%= calcula.calcula(50) %>		
		
	</body>
</html>