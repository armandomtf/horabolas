<%@page import="com.br.horabolas.servlet.UsuarioControle"%>
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
    <body>
        <h1>Lista dos usuários</h1>
        <%
            List<Usuario> lista = UsuarioControle.listar();
            request.setAttribute( "usuarios", lista );
        %>
        <display:table name="usuarios">
            <display:column property="id" title="ID" paramProperty="checkbox"/>
            <display:column property="nome" title="Nome Completo"/>
            <display:column property="senha" title="Senha"/>
            <display:column value="alterar" title="Alterar" href="alterar.jsp" paramId="pid" paramProperty="id" />             
            <display:column value="deletar" title="Deletar" autolink="true"  paramId="pid" paramProperty="id" href="${pageContext.request.contextPath}/UsuarioServletD"/>
            <display:setProperty name="basic.msg.empty_list" value="Sem usuarios" />
        </display:table>
        <br><br>
        <a href="alterar.jsp?pid=" >Criar novo usuario</a>
    </body>
</html>