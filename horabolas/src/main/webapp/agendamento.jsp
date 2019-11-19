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

	<div class="container">

		
            <a href="index.html"> <img  src="imagens/logo.png" width="120px"/> </a>

<ul class="navbar-nav mr-auto">

	<li class="nav-item">
		<a class="nav-link " href="agendamento.jsp">Agendamento</a>
	</li>
        
        <li class="nav-item">
		<a class="nav-link " href="semagendamento.html">Meus agendamentos</a>
	</li>

</ul>

<ul class="navbar-nav ml-auto">
                        <!---------------------MODAL  Entra---------------------->

                     
                            <button type="button" class="btn btn-default" alt="Entrar" data-toggle="modal" data-target="#mymodal">
                                Entrar
                            </button>

                       

                        <div class="modal fade" role="dialog" id="mymodal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h2>Login</h2>
                                    </div>
                                    <form action="UsuarioServletLogin" method="post"> 
                                        <div class="modal-body">
                                            Email:
                                            <div class=" form-group"> 
                                                <input type="email" name="email" id="email" class="form-control" placeholder="Digite seu email" required>


                                            </div>
                                            Senha:
                                            <div class=" form-group">
                                                <input type="password" name="senha" id="senha" class="form-control" placeholder="Digite sua senha" required><br>
                                                <input type="submit" value="Entrar" class="btn-btn-default">
                                            </div>
                                    </form>


                                    <a href="cadastro.html">Não possui uma conta?</a>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>

                                </div>

                            </div>
                        </div>
                </div>

                <!---------------------Final MODAL Entra---------------------->
            </ul>

        </div>
    </div>

</nav>
<!---------------------Fim NAVBAR---------------------->

<p></p>	


<p></p>	

<!---------------------Cards---------------------->
<div id="divao">
    <%
        List<Quadras> lista = QuadraControle.listarquadras();
        request.setAttribute("quadras", lista);
        for (Iterator it = lista.iterator(); it.hasNext();) {

            Quadras quadra = (Quadras) it.next();
            String codigo = quadra.getId().toString();
            System.out.println(codigo);
            byte[] imagem = quadra.getFoto();
            String quadraFoto = Base64.getEncoder().encodeToString(imagem);


    %>

    <div class="imagens">

        <img class="quadraimg" src="data:image/png;image/jpg;base64,<%=quadraFoto%>" alt="Logo Hora Bolas"/>
        <h5 class="card-title"><%=quadra.getNome()%></h5>
        <p class="card-text" style="width:1000px; max-width: 100%;"><%=quadra.getDescricao()%></p>

        <!--modal de horarios-->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#<%=codigo%>">
            Escolha seu horario
        </button>

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


<!-----------rodapé----------------->
<p></p>
<div id="rodape">
    <center>
        <img src="imagens/logonaoumgruposomosumtime.png" id="imgrodape""/>
        <img src="imagens/nomedosenvolvidos.png"  id="imgrodape"">
    </center>



</div>

<!-----------Fim do rodapé-------------------------->

</body>
</html>