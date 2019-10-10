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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud</title>
    </head>
    <body>
        <h1>Quadras</h1>
        <%
            List<Quadras> lista = QuadraControle.listarquadras();
            Quadras q = lista.get(2);
            byte[] imagem = q.getFoto();
            String encodedImage = Base64.getEncoder().encodeToString(imagem);
            request.setAttribute("quadras", lista);
        %>
        <display:table name="quadras">
            <display:column property="nome" title="Nome"/>
            <display:column property="descricao" title="Descrição"/>
            <display:column title="Foto">
                <img src="data:image/png;image/jpg;base64,<%=encodedImage%>" width='300' height='300'>
            </display:column>
            <display:setProperty name="basic.msg.empty_list" value="Sem quadras" />
        </display:table>
        
    </body>
</html>