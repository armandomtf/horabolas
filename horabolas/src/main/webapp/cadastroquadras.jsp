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

    <style>
        #tamanho{
            height: 400px;
            width: 500px;
            background-color: #d9d9d9;  
        }

        #tamanho2{
            height: 800px;
            width: 100%;
            background-color: #FFF2020;  
        }


    </style>
</head>
<body background="imagens/fundotelaregistro.jpg">


    <!---------------------NAVBAR---------------------->
    <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">

        <div class="container">


            <a href="principaladm.jsp"> <img  src="imagens/logo.png" width="120px"/> </a>

            <ul class="navbar-nav mr-auto">

                <li class="nav-item">
                    <a class="nav-link " href="agendamentoadm.jsp">Agendamento</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " href="listar.jsp">CRUD</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " href="meusagendamentos.jsp">Meus agendamentos</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " href="cadastroadm.jsp">Cadastro ADM</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="cadastroquadras.jsp">Cadastrar Quadras</a>
                </li>

            </ul>

            <ul class="navbar-nav ml-auto">
                <!---------------------Final MODAL Entra---------------------->
            </ul>

        </div>

    </nav>
    <!---------------------Fim NAVBAR---------------------->
<center id="rodape">
    <div id="tadm2" class="jumbotron" style="margin-top: 20px">

        <h1>Quadrastro</h1><br>

        <div id="tamanho" class="jumbotron">

            <form action="QuadraServlet" method="post" enctype="multipart/form-data">
                <div hidden>
                    ID<input type="text" name="pid" value="">
                </div>
                Nome:<br> <input type="text" name="nome" placeholder="Nome da Quadra"><br><br>
                Descrição:<br> <textarea name="descricao" placeholder="Descrição da Quadra" rows="2" cols="20"></textarea><br><br>
                Foto:<br> <input type="file" name="foto"><br><br> 
                <input type="submit" value="Enviar">
            </form>

        </div>

    </div>
</center>
</body>
</html>

