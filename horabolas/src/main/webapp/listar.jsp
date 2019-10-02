<%@page import="com.br.horabolas.entidades.Quadras"%>
<%@page import="com.br.horabolas.entidades.Usuarioadm"%>
<%@page import="com.br.horabolas.servlet.ControladorDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="com.br.horabolas.entidades.Usuario" />
<jsp:directive.page import="java.util.List" />
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
<body background="imagens/fundotelaregistro.jpg">


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


<center>
    <div class="jumbotron" style="margin-top: 150px">



        <%
            List<Usuario> lista = ControladorDB.listar();
            request.setAttribute("usuarios", lista);
        %>
        <display:table id="myTABLE" name="usuarios" >
            <display:column property="id" title="ID" paramProperty="checkbox"/> </td> 
            <display:column property="nome" title="Nome Completo"/>
            <display:column property="email" title="Email"/>
            <display:column property="senha" title="Senha"/>
            <display:column value="Alterar" title="Alterar" href="alterar.jsp" paramId="pid" paramProperty="id" />             
            <display:column value="Deletar" title="Deletar" autolink="true"  paramId="pid" paramProperty="id" href="${pageContext.request.contextPath}/UsuarioServletD"/>
            <display:setProperty name="basic.msg.empty_list" value="Sem usuarios" />
        </display:table>
        <br><br>
        
        



        </center> 
<p></p>
<div id="rodape">
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



        </body>
        </html>