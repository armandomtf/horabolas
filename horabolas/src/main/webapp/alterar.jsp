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
        <title>Crud</title>
    </head>
    <title>Horabolas-Crud</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width-device-width", initial-scale-1.0>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"  href="estilo.css" />
</head>
<body background="imagens/fundotelaregistro.jpg">


    <!---------------------NAVBAR---------------------->
    <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">

        <div class="container">


            <a href="principaladm.jsp"> <img  src="imagens/logo.png" width="120px" alt="Logo Hora "  title="HoraBolas"/>  </a>

            <ul class="navbar-nav mr-auto">

                <li class="nav-item">
                    <a class="nav-link " href="Agendamentoadm.jsp">Agendamento</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="a">Contato</a>
                </li>	
                <div id="borda"
                     <li class="nav-item">
                        <a class="nav-link " href="listar.jsp">CRUD</a>

                    </li>
                </div>
            </ul>

            <ul class="navbar-nav ml-auto">
                <!---------------------MODAL  Entra---------------------->

                <%
                    Usuarioadm usuarioadm = (Usuarioadm) session.getAttribute("UsuarioAdmLogado");
                %>
                <a class="nav-link">Bem vindo, <%=usuarioadm.getNome()%>!</a>
                <a href="index.html"><button type="button" class="btn btn-default" >Sair</button></a>

                <!---------------------Final MODAL Entra---------------------->
            </ul>

        </div>
    </div>

</nav>
<!---------------------Fim NAVBAR---------------------->
<center>
    <div class="jumbotron" style="margin-top: 150px">


        <h1>Leitura e alteração!</h1>
        <%
            //Criar variaveis
            Usuario usuario = new Usuario();
            String nome = "";
            String email = "";
            String senha = "";

            //Captura id (se alteração)
            String id = request.getParameter("pid");

            //Localiza usuario (se alteração)
            if (!id.isEmpty()) {
                usuario = ControladorDB.buscar(Integer.parseInt(id));
                nome = usuario.getNome();
                email = usuario.getEmail();
                senha = usuario.getSenha();

            } else {
                id = "";
            }

        %>
        <form id="brlongo" method="POST" action="UsuarioServletAlterar">
            <div hidden>
                ID<input type="text" name="pid" value="<%=id%>">
            </div>
            Nome<input type="text" name="nome" value="<%=nome%>">
            <br><br>
            Email<input type="email" name="email" value="<%=email%>"> 
            <br><br>
            Senha<input type="text" name="senha" value="<%=senha%>">
            <br>
            <input type="submit">
        </form>
</center>
</body>
</html>

