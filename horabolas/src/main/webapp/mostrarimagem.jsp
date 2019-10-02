
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IMAGEM</title>
    </head>
    <body>
        <%
      BufferedImage bImage = ImageIO.read(image));
      ByteArrayOutputStream bos = new ByteArrayOutputStream();
      ImageIO.write(bImage, "jpg", bos );
      byte [] data = bos.toByteArray();
        %>
        
        <img src="<%=bImage%>">
    </body>
</html>
