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
    </head>
    <body>


        <!---------------------NAVBAR---------------------->
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">

            <div class="container">


                <a href="principal.jsp"> <img  src="imagens/logo.png" width="120px"/> </a>

                <ul class="navbar-nav mr-auto">
                    <div id="borda">
                        <li class="nav-item">
                            <a class="nav-link " href="Agendamento.jsp">Agendamento</a>
                        </li>
                    </div>

                    <li class="nav-item">
                        <a class="nav-link " href="a">Contato</a>
                    </li>	
                </ul>

                <ul class="navbar-nav ml-auto">
                    <ul class="navbar-nav ml-auto">
                        <!---------------------MODAL  Entra---------------------->
                        <%
                            Usuario usuario = (Usuario) session.getAttribute("UsuarioLogado");
                        %>
                        <a class="nav-link">Bem vindo, <%=usuario.getNome()%>!</a>
                        <a href="index.html"><button type="button" class="btn btn-default" >Sair</button></a>
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
            <display:column property="id" title="ID" paramProperty="checkbox"/></td> 
            <display:column property="nome" title="Nome Completo"/>
            <display:column property="descricao" title="Descrição"/>
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
                    <img src="imagens/ginasiopoliesportivo.jpg" width="700 px">

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
                    <img src="imagens/quadradocarmo.jpg" width="700 px">
                    <h5 class="card-title">Quadra do carmo</h5>
                    <p class="card-text">Uma das maiores e mais usadas quadras de Quissamã.</p>

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
                    <img src="imagens/quadracantodasaudade.jpg" width="700 px">
                    <h5 class="card-title">Quadra do canto da saudade</h5>
                    <p class="card-text">Localizada proxima ao simiterio da cidade, é uma das menores quadras da cidade.</p>

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
                    <img src="imagens/parqueaquatico.jpg" width="700 px">
                    <h5 class="card-title">Parque Aquático</h5>
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