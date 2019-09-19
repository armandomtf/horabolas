<%@page import="com.br.horabolas.servlet.UsuarioControle"%>
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

		
		<a href="index.html"> <img  src="imagens/logo.png" width="120px"/> </a>

<ul class="navbar-nav mr-auto">

	<li class="nav-item">
		<a class="nav-link " href="Agendamento.html">Agendamento</a>
	</li>
	<li class="nav-item">
		<a class="nav-link " href="">Timeline</a>
	</li>
<li class="nav-item">
		<a class="nav-link " href="a">Contato</a>
	</li>	
</ul>

<ul class="navbar-nav ml-auto">
	<!---------------------MODAL  Entra---------------------->

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodal">
	Entrar
</button>

<div class="modal fade" role="dialog" id="mymodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h2>Login</h2>
			</div>
			<div class="modal-body">
				<div class=" form-group">
				<input type="text" name="Email" class="form-control" placeholder="Email">
             </div>

			<div class=" form-group">
				<input type="password" name="Senha" class="form-control" placeholder="Senha">
             </div>
<a href="Registro.html">Não possui uma conta?</a>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
				<button type="button" class="btn btn-success" data-dismiss="modal">Seguir</button>
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
<center>
<div class="jumbotron" style="margin-top: 150px">
        
        
        <h1>Leitura e alteração!</h1>
        <%
        //Criar variaveis
        Usuario usuario = new Usuario();
        String nome = "";
        String senha = "";
        //Captura id (se alteração)
        String id = request.getParameter("pid");
        
        //Localiza usuario (se alteração)
        if(!id.isEmpty()){
            usuario = UsuarioControle.buscar(Integer.parseInt(id));
            nome = usuario.getNome();
            senha = usuario.getSenha();            
        }
        else{
            id = "";
        }
        
        %>
        <form id="brlongo" method="POST" action="UsuarioServletSA">
            <div hidden>
                ID<input type="text" name="pid" value="<%=id%>">
            </div>
            Nome<input type="text" name="nome" value="<%=nome%>">
            <br><br>
            Senha<input type="text" name="senha" value="<%=senha%>">
            <br>
            <input type="submit">
        </form>
</center>
    </body>
</html>

