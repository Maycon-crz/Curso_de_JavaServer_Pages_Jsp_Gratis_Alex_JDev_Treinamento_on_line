<!-- Incluindo a class calcula / Para incluir a regra de negócio -->
<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<jsp:include page="cabecalho.jsp"/>
		<h3>fsdfsdfdsfsdfsdf</h3>
		<jsp:include page="rodape.jsp"/>
		
		<!-- recupera o atributo nome do objeto calcula obs Para isso funcionar é necessário ter importado lá em cima o   -->
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
		
		<!-- JSL -->
			<!-- Exeplo de como usar tags JSL -->
			<c:out value="${'bem vindo ao JSTL'}"/>
			
			<!-- Este código retorna o html da link informado no caso o do google é como se uma variável -->
			<c:import var="data" url="https://www.google.com.br"/>
			<!-- A próxima tag imprime a import a cima como o nome usado em var="" -->
			<c:out value="${data}"></c:out>
			
			<!-- Esta tag realiza o calculo / seta a variavel -->
			<c:set var="data" scope="page" value="${500*6}" />
			<!-- A próxima remove a variavel  -->
			<c:remove var="data"/>
			<!-- Nesta imprime a variavel porem como foi removida não ira imprimir nada -->
			<c:out value="${data}"></c:out>
			
			<!-- Exceção no No caso de erro -->
			<c:catch var="erro">
				<% int var = 100/0; %>
				<!-- OU  <%= 100/0 %> -->
			</c:catch>		
			<c:if test="${erro != null}">
				${erro.message}
			</c:if>
			
			<!-- Tags com condições -->
			<c:set var="numero" value="${100/2}"/>		
			<c:choose>
				<c:when test="${numero > 50}">
					<c:out value="${'Maior que 50'}"/>
				</c:when>			
				<c:when test="${numero < 50}">
					<c:out value="${'Menor que 50'}"/>
				</c:when>			
				<c:otherwise>
					<c:out value="${'Não encontrou valor correto'}"/>
				</c:otherwise>
			</c:choose>	
			
			<!-- For com JSL -->
			<c:set var="numero" value="${100/3}"/>		
			<c:forEach var="n" begin="1" end="${numero}">
				Item : ${n}
				<br/>
			</c:forEach>
			
			<!-- Separando e imprimindo items por um sinal específico -->
			<c:forTokens items="Alex-Fernando-Egidio" delims="-" var="nome">
				Nome : <c:out value="${nome}"/>
				<br/>
			</c:forTokens>
			
			<!-- Criando um url com parametros get -->
			<c:url value="/acessoliberado.jsp" var="acesso">
				<c:param name="para1" value="111"/>
				<c:param name="para2" value="222"/>
			</c:url>
		<!--  -->
			
		<!-- ----- -->
	</body>
</html>