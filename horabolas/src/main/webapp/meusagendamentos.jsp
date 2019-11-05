

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.br.horabolas.util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.br.horabolas.entidades.*" />
<jsp:directive.page import="com.br.horabolas.servlet.*" />
<jsp:directive.page import="java.util.*" />
<!DOCTYPE html>
<html>
    <head>
        <title>Horabolas</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width-device-width", initial-scale-1.0>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css"  href="estilo.css" />

    </head>
    <body>

        <!---------------------NAVBAR---------------------->
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">

            <div class="container">


                <a href="principal.jsp"> <img  src="imagens/logo.png" width="120px" alt="Logo Hora "  title="HoraBolas"/>  </a>
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link " href="agendamentousuario.jsp">Agendamento</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " href="a">Contato</a>
                    </li>	
                
                <li class="nav-item">
                     <a class="nav-link " href="meusagendamentos.jsp">Meus agendamentos</a>
                    </li>	
                </ul>
                
                <ul class="navbar-nav ml-auto">
                    <!---------------------MODAL  Entra---------------------->
                    <%
                        Usuario usuario = (Usuario) session.getAttribute("UsuarioLogado");
                    %>
                    <a class="nav-link">Bem vindo, <%=usuario.getNome()%>!</a>
                    <a href="UsuarioServletLogout"><button type="button" class="btn btn-default" >Sair</button></a>
                    <!---------------------Final MODAL Entra---------------------->
                </ul>

            </div>
        </div>

    </nav>
    <!---------------------Fim NAVBAR---------------------->
    
    <center>
<div class="jumbotron" style="margin-top: 150px">


        <h1>Meus agendamentos</h1>
        <table style="width:100%">
 <div class="jumbotron" style="margin-top: 150px">


        <%
            List<Quadras> listaq = QuadraControle.listarquadras();
            request.setAttribute("meusagendamentos", listaq);
        %>

        <display:table id="myTABLE" name="agendamento">
            <display:column property="id" title="ID" paramProperty="checkbox"/></td> 
            <display:column property="nome" title="Data"/>
            <display:column property="descricao" title="Hora"/>
            <display:column property="foto" title="Quadra"/>
            <display:setProperty name="basic.msg.empty_list" value="Sem quadras" />
        </display:table>

        
</div>
</center>


    <!-----------rodapé----------------->
    <p></p>
    <div id="rodape">
        <center>
            <img src="imagens/logonaoumgruposomosumtime.png" width="300px;">
            <img src="imagens/nomedosenvolvidos.png"  width="300px;">
        </center>



    </div>

    <!-----------Fim do rodapé-------------------------->



</body>
</html>