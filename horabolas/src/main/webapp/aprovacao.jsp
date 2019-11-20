<%@page import="com.br.horabolas.servlet.AgendamentoControle"%>
<%@page import="com.br.horabolas.entidades.Agendamento"%>
<%@page import="com.br.horabolas.entidades.Usuarioadm"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.br.horabolas.util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="com.br.horabolas.entidades.*"/>
<jsp:directive.page import="com.br.horabolas.servlet.*" />
<jsp:directive.page import="java.util.*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aprovação</title>
    </head>
    <title>Horabolas-Aprovar</title>
    <meta name="viewport" content="width-device-width", initial-scale-1.0>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css"  href="estilo.css" />
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
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
                <div id="borda">
                    <li class="nav-item">
                        <a class="nav-link " href="aprovacao.jsp">Aprovação</a>
                    </li>
                </div>

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

        </div>
    </div>

</nav>
<!---------------------Fim NAVBAR---------------------->


<center>
    <div class="jumbotron" style="margin-top: 50px">


        <table>
            <thead>
                <tr class="table100-head">
                    <th class="column2">Usuário</th>
                    <th class="column2">Quadra</th>
                    <th class="column2">Horário</th>
                    <th class="column2">Status</th>
                    <th class="column2">Horário do Agendamento</th>
                    <th class="column2">Aprovar</th>
                    <th class="column2">Rejeitar</th>
                </tr>
            </thead>



            <%
                List<Agendamento> listaag = AgendamentoControle.listaragendamentosfull();
                request.setAttribute("meusagendamentos", listaag);
                for (Iterator it = listaag.iterator(); it.hasNext();) {

                    Agendamento a = (Agendamento) it.next();
                    Quadras q = a.getIdQuadraIda();
                    Usuario u = a.getIdUsuarioIda();

            %>


            <tbody>
                <tr>
                    <td class="column2"><%=u.getNome()%></td>
                    <td class="column2"><%=q.getNome()%></td>
                    <td class="column2"><%=a.getDataQuadra()%></td>
                    <td class="column2"><%=a.getAprovacao()%></td>
                    <td class="column2"><%=a.getDataUso()%></td>

                    <td class="column2">
                        <form action="AgendamentoAprovar" method="post">
                            <div hidden>
                                <input type="text" value="<%=a.getIda()%>" name="pid">
                            </div>
                            <input type="submit" value="Aprovar">
                        </form>
                    </td>

                    <td clarss="column2">
                        <form action="AgendamentoRejeitar" method="post">
                        <div hidden>
                            <input type="text" value="<%=a.getIda()%>" name="pid">
                        </div>
                        <input type="submit" value="Rejeitar">
                        </form>
                    </td>
                </tr>

            </tbody>
            <%}%>
        </table>
    </div>

</center>
<div id="rodape">
    <center>
        <img src="imagens/logonaoumgruposomosumtime.png" id="imgrodape">
        <img src="imagens/nomedosenvolvidos.png"  id="imgrodape">
    </center>
</div>
</body>
</html>