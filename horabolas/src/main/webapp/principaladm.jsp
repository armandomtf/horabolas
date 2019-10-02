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
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark ">
            
            <div class="left">

            <div class="container">


                <a href="principaladm.jsp" alt="horabolas" title="Hora Bolas"> <img  src="imagens/logo.png" width="120px"/> </a>
                
            </div>
            </div>
                
                <div class="left"> 

                <ul class="navbar-nav mr-auto">
                    <div id="borda">
                        <li class="nav-item">
                            <a class="nav-link " href="Agendamentoadm.jsp" alt="agendamento" title="Agendamento">Agendamento</a>
                        </li>
                    </div>
                </ul>
                    
                </div>
                
                 <div class="left">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link " href="a"alt="contato" title="Contato">Contato</a>

                    </li>
                    </div>
                
                <div class="left">
                    <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link " href="listar.jsp" alt="crud" title="Crud">CRUD</a>
                    </li>
                </ul>
                </div>
                
                <div class="right">

                <ul class="navbar-nav ml-auto">
                    <ul class="navbar-nav ml-auto">
                        <!---------------------MODAL  Entra---------------------->
                        <%
                            Usuarioadm usuarioadm = (Usuarioadm) session.getAttribute("UsuarioAdmLogado");
                        %>
                        <a class="nav-link" alt="bem vindo" title="Mensagem de Bem vindo">Bem vindo, <%=usuarioadm.getNome()%>, lindão</a>
                        <a href="index.html"><button type="button" class="btn btn-default" alt="sair" title="Sair">Sair</button></a>
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
    <div id="rodape" id="relative">
   
    
        <marquee>
           
        <img src="imagens/logonaoumgruposomosumtime.png" width="300px;" title="TG">
        <img src="imagens/nomedosenvolvidos.png"  width="300px;">
            
        </marquee>
        <!---------------------MODAL  Entra---------------------->


        <div class="modal fade" role="dialog" id="mymodal1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2>Login</h2>
                    </div>

                </div>

            </div>
        </div>
</div>


    <!-----------Fim do rodapé-------------------------->



</body>
</html>