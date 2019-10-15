

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
                        <a class="nav-link " href="Agendamento.jsp">Agendamento</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " href="a">Contato</a>
                    </li>	
                </ul>

                <ul class="navbar-nav ml-auto">
                    <!---------------------MODAL  Entra---------------------->
                    <%
                        Usuario usuario = (Usuario) session.getAttribute("UsuarioLogado");
                    %>
                    <a class="nav-link">Bem vindo, <%=usuario.getNome()%>!</a>
                    <a href="index.html"><button type="button" class="btn btn-default" >Sair</button></a>
                    <!---------------------Final MODAL Entra---------------------->
                </ul>

            </div>
        </div>

    </nav>
    <!---------------------Fim NAVBAR---------------------->

    <p></p>	
    <!---------------------Carosel---------------------->

    <div class="container-fluid" id="container-carousel">
        <div class="container">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="imagens/quadradocarmo.jpg" alt="Primeiro Slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="imagens/ginasiopoliesportivo.jpg" alt="Segundo Slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="imagens/quadracantodasaudade.jpg" alt="Terceiro Slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Anterior</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Próximo</span>
                </a>
            </div>

        </div>
    </div>
    <!---------------------Fim Carosel---------------------->


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