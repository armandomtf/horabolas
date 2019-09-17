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
    <body>
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
        <form method="POST" action="UsuarioServletSA">
            <div hidden>
                ID<input type="text" name="pid" value="<%=id%>">
            </div>
            Nome<input type="text" name="nome" value="<%=nome%>">
            Senha<input type="text" name="senha" value="<%=senha%>">
            <input type="submit">
        </form>
    </body>
</html>