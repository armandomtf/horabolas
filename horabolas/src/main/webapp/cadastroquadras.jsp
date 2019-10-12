<%@page import="com.br.horabolas.entidades.Usuarioadm"%>
<%@page import="com.br.horabolas.servlet.ControladorDB"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.br.horabolas.entidades.Usuario" />
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="com.br.horabolas.util.HibernateUtil" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Quadras</title>
    </head>
    <title>Cadastrar Quadras</title>
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


            <a href="principaladm.jsp"> <img  src="imagens/logo.png" width="120px" alt="Logo Hora "  title="HoraBolas"/>  </a>

            <ul class="navbar-nav mr-auto">
                
                <li class="nav-item">
                    <a class="nav-link " href="agendamentoadm.jsp">Agendamento</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="a">Contato</a>
                </li>	

                <li class="nav-item">
                    <a class="nav-link " href="listar.jsp">CRUD</a>

                </li>

                <li class="nav-item">
                    <a class="nav-link " href="cadastroadm.jsp">Cadastrar ADM</a>
                </li>

                <div id="borda">
                    <li class="nav-item">
                        <a class="nav-link " href="cadastroquadras.jsp">Cadastrar Quadras</a>
                    </li>
                </div>   
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

    </nav>
    <!---------------------Fim NAVBAR---------------------->
<center>
    <div class="jumbotron" style="margin-top: 150px">


        <h1>Cadastre uma nova quadra!</h1>
        <form action="QuadraServlet" method="post" enctype="multipart/form-data">
            <div hidden>
                ID<input type="text" name="pid" value="">
            </div>
            Nome:<input type="text" name="nome" placeholder="Nome da Quadra"><br><br>
            Descrição:<textarea name="descricao" placeholder="Descrição da Quadra" rows="4" cols="50"></textarea><br><br>
            Foto:<input type="file" name="foto"><br><br> 
            <input type="submit" value="Enviar">
        </form>
    </div>
</center>
</body>
</html>

