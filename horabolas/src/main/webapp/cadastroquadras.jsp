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

        #tadm2{
            width: 100%;
            margin-top: 30px;
        }
        
        

    </style>
</head>
<body>


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
                    <a class="nav-link " href="cadastroadm.jsp">Cadastro ADM</a>
                </li>
                <div id="borda">
                    <li class="nav-item">
                        <a class="nav-link " href="cadastroquadras.jsp">Cadastrar Quadras</a>
                    </li>
                </div>
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

<div id="tadm2" class="jumbotron" align="center">
    <h1>Quadrastro</h1><br>

    <form action="QuadraServlet" method="post" enctype="multipart/form-data" class="formulario">
        <div hidden>
            ID<input type="text" name="pid" value="">
        </div>
        Nome: <input type="text" name="nome" placeholder="Nome da Quadra"><p></p>
        Descrição: <textarea name="descricao" placeholder="Descrição da Quadra" rows="2" cols="20"></textarea><p></p>
        Foto: <input type="file" name="foto">
        <input type="submit" value="Enviar" class="butao">
    </form>

</div>

<center id="rodape">
</center>
</body>
</html>

