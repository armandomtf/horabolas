<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.br.horabolas.util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.br.horabolas.entidades.*" />
<jsp:directive.page import="com.br.horabolas.servlet.*" />
<jsp:directive.page import="java.util.*" />
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Horabolas</title>
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

		
            <a href="index.html"> <img  src="imagens/logo.png" width="120px"/> </a>

<ul class="navbar-nav mr-auto">

	<li class="nav-item">
		<a class="nav-link " href="agendamentousuario.jsp">Agendamento</a>
	</li>
        
        <li class="nav-item">
		<a class="nav-link " href="meusagendamentos.jsp">Meus agendamentos</a>
	</li>

</ul>

<ul class="navbar-nav ml-auto">
                <!---------------------MODAL  Entra---------------------->
                <%
                    Usuario usuario = (Usuario) session.getAttribute("UsuarioLogado");
                %>
                <a class="nav-link">Bem vindo, <%=usuario.getNome()%>!</a>
                <a href="UsuarioServletLogout"><button type="button" class="btn btn-default" >Sair</button></a>
                <!---------------------Final MODAL Entra---------------------->
            </ul>

        </div>
    </div>

</nav>
<!---------------------Fim NAVBAR---------------------->

<center>
    <div class="jumbotron" style="margin-top: 0px">

    <h1>Meus agendamentos</h1>
    <table style="width:100%" >
        
        <div class="jumbotron"  style="margin-top: 0px">
    
        
        


            <%
                List<Agendamento> listaag = AgendamentoControle.listaragendamentos(usuario.getId());

                request.setAttribute("meusagendamentos", listaag);

                for (Iterator it = listaag.iterator(); it.hasNext();) {

                    Agendamento a = (Agendamento) it.next();
                    Quadras q = a.getIdQuadraIda();
                    System.out.println(q);
            %>



            <div class="agendamentos">
                Horário da quadra:
                <p><%=a.getDataQuadra()%></p>
                Status:
                <p><%=a.getAprovacao()%></p>
                Data do agendamento:
                <p><%=a.getDataUso()%></p>
                Quadra:
                <p><%=q.getNome()%></p>
            </div>
            <%}%>
            
    </div>
            
    </table>
        </div>
</center>

<!-----------rodapé----------------->
<p></p>
<div id="rodape">
    <center>
        <img src="imagens/logonaoumgruposomosumtime.png" id="imgrodape">
        <img src="imagens/nomedosenvolvidos.png"  id="imgrodape">
    </center>



</div>

<!-----------Fim do rodapé-------------------------->



</body>
</html>