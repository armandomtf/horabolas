<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.br.horabolas.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@page import="com.br.horabolas.servlet.ControladorDB"%>
<%@page import="com.br.horabolas.entidades.Quadras"%>
<%@page import="com.br.horabolas.entidades.Usuario"%>
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
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">

            <div class="left">

                <div class="container">

                    <a href="index.html"> <img  src="imagens/logo.png" width="120px" alt="Logo Hora "  title="HoraBolas"/>  </a>
                </div>

            </div>

            <div class="left">

                <ul class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link " href="Agendamento.html">Agendamento</a>
                    </li>
                </ul>


            </div>

            <div class="left">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link " href="a">Contato</a>

                    </li>	
                </ul>
            </div>

            <!---------------------MODAL  Entra---------------------->
            <div class="right">

              <ul class="navbar-nav ml-auto">
                    <ul class="navbar-nav ml-auto">
                        <!---------------------MODAL  Entra---------------------->
                        <%
                            Usuario usuario= (Usuario) session.getAttribute("UsuarioLogado");
                        %>
                        <a class="nav-link">Bem vindo, <%=usuario.getNome()%>!</a>
                        <a href="index.html"><button type="button" class="btn btn-default" >Sair</button></a>
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

<!---------------------Cards---------------------->
<center>
    <div class="jumbotron" style="margin-top: 150px">



        <%
            List<Quadras> lista = ControladorDB.listarquadras();
            request.setAttribute("quadras", lista);
        %>
        <display:table id="myTABLE" name="quadras">
            <display:column property="id" title="ID" paramProperty="checkbox"/> 
            <display:column value="abc" title="Nome Completo"/>
            <display:column value="abc" title="Descrição"/>
            <display:column value="Alterar" title="Alterar" href="alterar.jsp" paramId="pid" paramProperty="id" />             
            <display:column value="Deletar" title="Deletar" autolink="true"  paramId="pid" paramProperty="id" href="${pageContext.request.contextPath}/UsuarioServletD"/>
            <display:setProperty name="basic.msg.empty_list" value="Sem usuarios" />
        </display:table>
        <br><br>



        </center>  
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <div class="ar">
                            <center>
                                <h4 class="card-title">Ginásio Poliesportivo</h4><br>
                                <img src="imagens/ginasiopoliesportivo.jpg" style="max-width: 100%; height:auto;" ><br>
                                <p class="card-text">aaaaaaa</p>

                                <!--modal de horarios-->
                        </div>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal1">
                            Escolha seu horario
                        </button></center>

                        <div class="modal fade" role="dialog" id="mymodal1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h2>Divirta Se!</h2>
                                    </div>
                                    <div class="modal-body">

                                        <center><button> 8:00 as 10:00 </button><br><br>
                                            <button> 10:00 as 12:00 </button><br><br>
                                            <button> 13:00 as 15:00 </button><br><br>
                                            <button> 15:00 as 17:00 </button><br><br>
                                            <button> 17:00 as 19:00 </button><br><br>
                                            <button> 19:00 as 21:00 </button><br></center>

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
                        <center>
                            <h4 class="card-title">Quadra do carmo</h4><br>
                            <img src="imagens/quadradocarmo.jpg" style="max-width: 100%; height:auto;"><br>
                            <p class="card-text">Uma das maiores e mais usadas quadras de Quissamã.</p>

                            <!--modal de horarios-->

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal2">
                                Escolha seu horario
                            </button></center>

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

                        <center>
                            <h4 class="card-title">Quadra do canto da saudade</h4><br>
                            <img src="imagens/quadracantodasaudade.jpg" style="max-width: 100%; height:auto;" alt="Arcondicinados" title="Ar condicionados e Climatizadores" ><br>
                            <p class="card-text">Localizada proxima ao simiterio da cidade, é uma das menores quadras da cidade.</p>

                            <!--modal de horarios-->

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal3">
                                Escolha seu horario
                            </button></center>

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
                        <center>
                            <h4 class="card-title">Parque Aquático</h4><br>
                            <img src="imagens/parqueaquatico.jpg" style="max-width: 100%; height:auto;"><br>
                            <p class="card-text">....</p>

                            <!--modal de horarios-->

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal4">
                                Escolha seu horario
                            </button></center>

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


<!-----------rodapé----------------->
<p></p>
<div id="rodape">
    <center>
        <img src="imagens/logonaoumgruposomosumtime.png" style="max-width: 100%; height:auto;"">
        <img src="imagens/nomedosenvolvidos.png"  width="300px;">
    </center>



</div>

<!-----------Fim do rodapé-------------------------->

</body>
</html>