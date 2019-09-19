<%@page import="com.br.horabolas.entidades.Usuarioadm"%>
<%@page import="com.br.horabolas.servlet.UsuarioControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="com.br.horabolas.entidades.Usuario" />
<jsp:directive.page import="java.util.List" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud</title>
    </head>
   <title>Horabolas-Crud</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width-device-width", initial-scale-1.0>
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	 <link rel="stylesheet" type="text/css"  href="estilo.css" />
</head>
<body background="imagens/fundotelaregistro.jpg">


	<!---------------------NAVBAR---------------------->
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">

	<div class="container">

		
		<a href="index.html"> <img  src="imagens/logo.png" width="120px"/> </a>

<ul class="navbar-nav mr-auto">

	<li class="nav-item">
		<a class="nav-link " href="Agendamento.html">Agendamento</a>
	</li>
	<li class="nav-item">
		<a class="nav-link " href="">Timeline</a>
	</li>
<li class="nav-item">
		<a class="nav-link " href="a">Contato</a>
	</li>	
</ul>

<ul class="navbar-nav ml-auto">
	<!---------------------MODAL  Entra---------------------->

<%
    Usuarioadm usuarioadm = (Usuarioadm) session.getAttribute("UsuarioAdmLogado");
    %>
<a class="nav-link">Bem vindo, <%=usuarioadm.getNome()%>!</a>
<a href="index.html"><button type="button" class="btn btn-default" >Sair</button></a>



<!---------------------Final MODAL Entra---------------------->
</ul>

		</div>
	</div>

	</nav>
<!---------------------Fim NAVBAR---------------------->

    
<center>
<div class="jumbotron" style="margin-top: 150px">
   
    
    
        <%
            List<Usuario> lista = UsuarioControle.listar();
            request.setAttribute( "usuarios", lista );
        %>
        <display:table id="myTABLE" name="usuarios">
            <display:column property="id" title="ID" paramProperty="checkbox"/></td> 
            <display:column property="nome" title="Nome Completo"/>
            <display:column property="senha" title="Senha"/>
            <display:column value="alterar" title="Alterar" href="alterar.jsp" paramId="pid" paramProperty="id" />             
            <display:column value="deletar" title="Deletar" autolink="true"  paramId="pid" paramProperty="id" href="${pageContext.request.contextPath}/UsuarioServletD"/>
            <display:setProperty name="basic.msg.empty_list" value="Sem usuarios" />
        </display:table>
        <br><br>
    
       
       <a href="alterar.jsp?pid=" >  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#mymodal">
Criar novo usuario
</button>
</a>
        
</center>   
</body>
</html>