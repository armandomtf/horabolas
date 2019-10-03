<%@page import="com.br.horabolas.entidades.Imagens"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.br.horabolas.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload Example in JSP and Servlet - Java web application</title>
    </head>

    <body> 
        <div>
            <h3> Choose File to Upload in Server </h3>
            <form action="FileUploadHandler" method="post" enctype="multipart/form-data">
                <input type="file" name="file"/>
                <input type="text" name="id"/>
                <input type="submit" value="upload" />
            </form>          
        </div>
        <%
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            String id = String.valueOf(123);
            String hql = "from Imagens u where u.id='" + id + "'";
            Imagens img = (Imagens) sessionRecheio.createQuery(hql).uniqueResult();
            tr.commit();
            byte[] b = img.getImagem();
           // InputStream is = img.getBinaryStream(1);
          //  return ImageIO.read(is);


        %>
        
        <input type="text" value="<%=b%>">

    </body>
</html>