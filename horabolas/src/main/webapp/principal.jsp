

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
        
        <style>
            * {
                box-sizing: border-box;
            }
            
            .left{
                
                padding: 20px;
                float: left;
                width: 20%;
                margin-right: 50px;
            }
            
            .right{
                
                padding: 20px;
                float: right;
                width: 20%;
                margin-left: 500px; 
            }
            
        </style>


    </head>
    <body>

        <!---------------------NAVBAR---------------------->
         <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">

            <div class="left">

                <div class="container">

                    <a href="principal.jsp"> <img  src="imagens/logo.png" width="120px" alt="Logo Hora "  title="HoraBolas"/>  </a>
                </div>

            </div>

            <div class="left">

                <ul class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link " href="Agendamento.jsp" alt="Agendamento" title="Agendamento">Agendamento</a>
                    </li>
                </ul>


            </div>

            <div class="left">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link " href="a" alt="Contato" title="Contato">Contato</a>

                    </li>	
                </ul>
            </div>

            <!---------------------MODAL  Entra---------------------->
            <div class="right">

                <ul class="navbar-nav ml-auto">
                    <ul class="navbar-nav ml-auto">
                        <!---------------------MODAL  Entra---------------------->
                        <%
                            Usuario usuario = (Usuario) session.getAttribute("UsuarioLogado");
                        %>
                        <a class="nav-link" title="Mensagem de Bem Vindo">Bem vindo, <%=usuario.getNome()%>!</a>
                        <a href="index.html"><button type="button" class="btn btn-default" alt="Sair" title="Sair">Sair</button></a>
                        <!---------------------Final MODAL Entra---------------------->
                    </ul>
                </ul>
                <!---------------------Final MODAL Entra---------------------->
                </ul>
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
                        <img class="d-block w-100" src="imagens/quadradocarmo.jpg" alt="Primeiro Slide" title="Quadra do Carmo">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="imagens/ginasiopoliesportivo.jpg" alt="Segundo Slide" title="Ginásio Poliestivo" >
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="imagens/quadracantodasaudade.jpg" alt="Terceiro Slide" title="Quadra do Canto da Saudade">
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
            <img src="imagens/tgg.png" width="300px;" alt="TG" title="TG">
            <img src="imagens/nomedosenvolvidos.png"  width="300px;">
        </center>



    </div>

    <!-----------Fim do rodapé-------------------------->



</body>
</html>