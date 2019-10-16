<%@page import="com.br.horabolas.entidades.Usuarioadm"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Horabolas-Agendamento</title>
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
                        <a class="nav-link" alt="bem vindo" title="Mensagem de Bem vindo">Bem vindo, <%=usuarioadm.getNome()%>, lind�o</a>
                         <a href="UsuarioAdmServletLogout"><button type="button" class="btn btn-default" >Sair</button></a>                        <!---------------------Final MODAL Entra---------------------->
                    </ul>
                </ul>
                        
                </div>
            </div>
    

    </nav>
    <!---------------------Fim NAVBAR---------------------->

    <p></p>	

    <!---------------------Cards---------------------->
    <div class="row">
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    
                    <img src="imagens/ginasiopoliesportivo.jpg" style="max-width: 100%; height:auto;" alt="Logo Hora Bolas"  title="GinasioPoliesportivo" >
                    <h5 class="card-title">Ginasio Poliesportivo</h5>
                    <p class="card-text">A maior e principal quadra de Quissam�</p>

                    <!--modal de horarios-->

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal1">
                        Escolha seu horario
                    </button>

                    <div class="modal fade" role="dialog" id="mymodal1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h2>Divirta Se!</h2>
                                </div>
                                <div class="modal-body">

                                    <button> 8:00 as 10:00 </button>
                                    <button> 10:00 as 12:00 </button>
                                    <button> 13:00 as 15:00 </button>
                                    <button> 15:00 as 17:00 </button>
                                    <button> 17:00 as 19:00 </button>
                                    <button> 19:00 as 21:00 </button>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!--modal de horarios final-->

                </div>
            </div>
        </div>

        <!------------------------------>

        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <img src="imagens/quadradocarmo.jpg" style="max-width: 100%; height:auto;">
                    <h5 class="card-title">Quadra do carmo</h5>
                    <p class="card-text">Uma das maiores e mais usadas quadras de Quissam�.</p>

                    <!--modal de horarios-->

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal2">
                        Escolha seu horario
                    </button>

                    <div class="modal fade" role="dialog" id="mymodal2">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h2>Divirta Se!</h2>
                                </div>

                                <div class="modal-body">
                                    <button> 8:00 as 10:00 </button>
                                    <button> 10:00 as 12:00 </button>
                                    <button> 13:00 as 15:00 </button>
                                    <button> 15:00 as 17:00 </button>
                                    <button> 17:00 as 19:00 </button>
                                    <button> 19:00 as 21:00 </button>
                                </div>


                            </div>
                        </div>
                    </div>

                    <!--modal de horarios final-->

                </div>
            </div>
        </div>
    </div>
    <!-------------------------->
    <p></p>
    <!------------------------------>
    <div class="row">
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <img src="imagens/quadracantodasaudade.jpg" style="max-width: 100%; height:auto;">
                    <h5 class="card-title">Quadra do canto da saudade</h5>
                    <p class="card-text">Localizada proxima ao simiterio da cidade, � uma das menores quadras da cidade.</p>

                    <!--modal de horarios-->

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal3">
                        Escolha seu horario
                    </button>

                    <div class="modal fade" role="dialog" id="mymodal3">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h2>Divirta Se!</h2>
                                </div>
                                <div class="modal-body">

                                    <button> 8:00 as 10:00 </button>
                                    <button> 10:00 as 12:00 </button>
                                    <button> 13:00 as 15:00 </button>
                                    <button> 15:00 as 17:00 </button>
                                    <button> 17:00 as 19:00 </button>
                                    <button> 19:00 as 21:00 </button>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!--modal de horarios final-->

                </div>
            </div>
        </div>

        <!-------------------------->
        <!------------------------------>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <img src="imagens/parqueaquatico.jpg" style="max-width: 100%; height:auto;">
                    <h5 class="card-title">Parque Aqu�tico</h5>
                    <p class="card-text">....</p>

                    <!--modal de horarios-->

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal4">
                        Escolha seu horario
                    </button>

                    <div class="modal fade" role="dialog" id="mymodal4">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h2>Divirta Se!</h2>
                                </div>
                                <div class="modal-body">

                                    <button> 8:00 as 10:00 </button>
                                    <button> 10:00 as 12:00 </button>
                                    <button> 13:00 as 15:00 </button>
                                    <button> 15:00 as 17:00 </button>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!--modal de horarios final-->

                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-------------------------->

<!---------------------Fim Cards---------------------->


<!-----------rodap�----------------->






<!-----------Fim do rodap�-------------------------->

</body>
</html>