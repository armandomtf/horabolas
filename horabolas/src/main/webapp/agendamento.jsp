<%@page import="java.util.Base64"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.br.horabolas.servlet.QuadraControle"%>
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

                    <a href="principal.jsp"> <img  src="imagens/logo.png" width="120px" alt="Logo Hora "  title="HoraBolas"/>  </a>
                </div>

            </div>

            <div class="left">

                <ul class="navbar-nav mr-auto">
                    <div id="borda">
                        <li class="nav-item">
                            <a class="nav-link " href="agendamentousuario.jsp">Agendamento</a>
                        </li>
                    </div>
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
                        
                        <!---------------------Final MODAL Entra---------------------->
                    </ul>
                </ul>
                <!---------------------Final MODAL Entra---------------------->
                </ul>
                </ul>

            </div>

        </nav>
        <!---------------------Fim NAVBAR---------------------->

        <p></p>	

        <!---------------------Cards---------------------->
        <div id="divao">
            <%
                List<Quadras> lista = QuadraControle.listarquadras();
                request.setAttribute("quadras", lista);
                for (Iterator it = lista.iterator(); it.hasNext();) {

                    Quadras quadra = (Quadras) it.next();
                    String codigo = quadra.getId().toString();
                    byte[] imagem = quadra.getFoto();
                    String quadraFoto = Base64.getEncoder().encodeToString(imagem);


            %>

            <div class="imagens">

                <img class="quadraimg" src="data:image/png;image/jpg;base64,<%=quadraFoto%>" alt="Logo Hora Bolas"/>
                <h5 class="card-title"><%=quadra.getNome()%></h5>
                <p class="card-text" style="width:1000px; max-width: 100%;"><%=quadra.getDescricao()%></p>

                <!--modal de horarios-->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal1">
                    Escolha seu horario
                </button>

                <div class="modal fade" role="dialog" id="mymodal1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h2>Horários:</h2>
                            </div>
                            <div class="modal-body">
                                <form action="AgendamentoServlet" method="post">
                                    <div hidden> 
                                        <input type="text" name="pid" value="">
                                        <input type="text" id="idquadra" name="idquadra" value="<%=codigo%>">
                                    </div> 
                                    <select name="data_quadra">
                                        <option value="13:00">13:00</option>
                                        <option value="14:00">14:00</option>
                                        <option value="15:00">15:00</option>
                                        <option value="16:00">16:00</option>
                                        <option value="17:00">17:00</option>
                                    </select> 
                                    <br> <br>
                                    <input type="submit" value="Agendar">
                                </form>

                            </div>
                        </div>
                    </div>
                </div>

                <!--modal de horarios final-->

            </div>


            <%}%>
        </div>
        <!-------------------------->

        <!---------------------Fim Cards---------------------->


        <!-----------rodapé----------------->
        <p></p>
        <div id="rodape">
            <center>
                <img src="imagens/logonaoumgruposomosumtime.png" style="max-width: 100%; height:auto; width:300px;"/>
                <img src="imagens/nomedosenvolvidos.png"  width="300px;">
            </center>



        </div>

        <!-----------Fim do rodapé-------------------------->

    </body>
</html>