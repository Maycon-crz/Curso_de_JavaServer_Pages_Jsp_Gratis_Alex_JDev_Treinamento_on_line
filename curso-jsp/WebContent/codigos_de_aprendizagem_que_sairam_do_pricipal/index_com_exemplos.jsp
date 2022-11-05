<!-- Incluindo a class calcula / Para incluir a regra de negócio -->
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
		
		<!-- Criando variáveis e métodos na view, obs:não recomendado em um projeto real -->		
		<%! 			
			int cont = 2;
			
			public int retorna(int n){
				return n*3;
			}
		
		%>
		<!-- Imprimir uma variável -->
		<%= cont %>
		
		<br/>
		
		<!-- Chamar um método -->
		<%= retorna(8) %>
		
		<br/>
		
		<!-- Capturar dado de um xml -->
		<%= application.getInitParameter("estado") %>
		
		<!-- Criando uma variável de sessão que fica gravada independente de refresh -->
		<% /*session.setAttribute("curso", "curso de jsp")*/ %>
		
		<!-- 
			Este exemplo mostra como fazer uma dinâmica para que quando ocorrer um erro
			na página o usuário seja redirecionado para uma página específica neste caso a
			página receber-nome.jsp;
		 -->
		<%@ page errorPage="receber-nome.jsp" %><!-- 2º Exemplo de diretivas -->		
		<%= 100/0 %><!-- Erro proposital para testar o redirecionamento para página de erro -->
		
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
		
		<!-- Recupera o atributo nome do objeto calcula, obs: Para isso funcionar é necessário ter importado lá em cima o <jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page" />   -->
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
		<!-- Chama método que foi importado/incluido usando jsp lá em cima -->
		<%= calcula.calcula(50) %>		
		
	</body>
</html>