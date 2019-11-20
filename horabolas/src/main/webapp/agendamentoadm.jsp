<%@page import="org.hibernate.Transaction"%>
<%@page import="com.br.horabolas.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="com.br.horabolas.entidades.*"%>
<%@page import="java.util.List"%>
<%@page import="com.br.horabolas.servlet.QuadraControle"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


                <a href="principaladm.jsp"> <img  src="imagens/logo.png" width="120px"/> </a>

                <ul class="navbar-nav mr-auto">
                    <div id="borda">
                        <li class="nav-item">
                            <a class="nav-link " href="agendamentoadm.jsp">Agendamento</a>
                        </li>
                    </div>

                    <li class="nav-item">
                        <a class="nav-link " href="aprovacao.jsp">Aprovação</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="listar.jsp">CRUD</a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link " href="cadastroadm.jsp">Cadastro ADM</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="cadastroquadras.jsp">Cadastrar Quadras</a>
                    </li>

                </ul>

                <ul class="navbar-nav ml-auto">

                    <!---------------------MODAL  Entra---------------------->
                    <%
                        Usuarioadm usuarioadm = (Usuarioadm) session.getAttribute("UsuarioAdmLogado");
                    %>
                    <a class="nav-link">Bem vindo, <%=usuarioadm.getNome()%>!</a>
                    <a href="UsuarioAdmServletLogout"><button type="button" class="btn btn-default" >Sair</button></a>

                    <!---------------------Final MODAL Entra---------------------->
                </ul>
                </ul>

            </div>
        </div>

    </nav>
    <p></p>
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


            <div class="modal fade" role="dialog" id="<%=codigo%>">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2>Horários:</h2>
                        </div>
                        <div class="modal-body">
                            <form action="AgendamentoServlet" method="post">
                                <div hidden> 
                                    <input type="text" name="pid" value="">
                                    <input type="text" name="idquadra" value="<%=codigo%>">
                                </div> 
                                <center>
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
                                </center>

                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!--modal de horarios final-->
        <%}%>


    </div>
    <!-------------------------->

    <!---------------------Fim Cards---------------------->


</body>
</html>