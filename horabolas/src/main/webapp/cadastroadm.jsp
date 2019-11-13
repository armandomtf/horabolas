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
        <title>Cadastrar Administrador</title>
    </head>
    <title>Cadastrar Administrador</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width-device-width", initial-scale-1.0>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"  href="estilo.css" />

    <style>
        #tadm{
            height: 350px;
            width: 590px;
            background-color: #d9d9d9;  
        }

        #tadm2{
            height: 650px;
            width: 100%;
            background-color: #FFF2020;  
        }
        
        .right{

                padding: 20px;
                float: right;
                width: 20%;
                margin-left: 700px; 
            }


    </style>
</head>
<body background="imagens/fundotelaregistro.jpg">


    <!---------------------NAVBAR---------------------->
    <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
        
        
       <div class="left">
                <div class="container">


                    <a href="principaladm.jsp"> <img  src="imagens/logo.png" width="120px" alt="Logo Hora "  title="HoraBolas"/>  </a>


                </div>
            </div>
                
                    
                    <div class="nav-item">
                        <a class="nav-link " href="agendamentoadm.jsp">Agendamento</a>
                    </div>
	
                    <div class="nav-item">
                        <a class="nav-link " href="listar.jsp">CRUD</a>
                    </div>

                    <div class="nav-item">
                        <a class="nav-link " href="cadastroadm.jsp">Cadastrar ADM</a>
                    </div>
                    <div class="nav-item">
                        <a class="nav-link " href="cadastroquadras.jsp">Cadastrar Quadras</a>
                    </div>
               
            <ul class="navbar-nav ml-auto">
                <!---------------------MODAL  Entra---------------------->

                <%
                    Usuarioadm usuarioadm = (Usuarioadm) session.getAttribute("UsuarioAdmLogado");
                %>
                <a class="nav-link">Bem vindo, <%=usuarioadm.getNome()%>!</a>
                <a href="UsuarioAdmServletLogout"><button type="button" class="btn btn-default" >Sair</button></a>

                <!---------------------Final MODAL Entra---------------------->
            </ul>

        </div>

    </nav>
    <!---------------------Fim NAVBAR---------------------->
<center id="rodape">
    <div id="tadm2" class="jumbotron" style="margin-top: 40px">
        
        <h1>Cadastrar um novo administrador</h1><br>

        <div id="tadm" class="jumbotron">

            <form method="post" action="UsuarioAdmServletSA">
                Email:<input type="email" name="email"><br><br>
                Nome: <input type="text" name="nome"><br><br>
                Senha: <input type="password" name="senha"><br><br>
                <input type="submit" value="Enviar"></form>
        </div>
    </div>
</center>
</body>
</html>

