<%@page import="java.util.Base64"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="com.br.horabolas.entidades.*"%>
<%@page import="java.util.List"%>
<%@page import="com.br.horabolas.servlet.ImagemControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud</title>
    </head>
    <body>
        <h1>Ibagens</h1>
        <%
            List<Imagens> lista = ImagemControle.listar();
            Imagens imagem = lista.get(0);
            byte[] imagemg = imagem.getImagem();
            String encodedImage = Base64.getEncoder().encodeToString(imagemg);
        %>
        <img src="data:image/png;base64,<%=encodedImage%>" width='300' height='300'>
    </body>
</html>