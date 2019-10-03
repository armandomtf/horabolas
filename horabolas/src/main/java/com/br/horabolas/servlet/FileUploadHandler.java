package com.br.horabolas.servlet;

import com.br.horabolas.entidades.Imagens;
import com.br.horabolas.util.HibernateUtil;
import com.lowagie.text.Image;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.Transaction;

@MultipartConfig

public class FileUploadHandler extends HttpServlet {

    private final String UPLOAD_DIRECTORY = "/home/aluno/upload";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //process only if its multipart content
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        //Part a = request.getPart("item");
                        //   final String fileName = getFileName(a);
                        // System.out.println(fileName);
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                        File file = new File(UPLOAD_DIRECTORY + File.separator + name);
                        byte[] picInBytes = new byte[(int) file.length()];
                        FileInputStream fileInputStream = new FileInputStream(file);
                        fileInputStream.read(picInBytes);
                        fileInputStream.close();
                        Imagens imagem = new Imagens();
                        imagem.setCdImagem(1234);
                        imagem.setImagem(picInBytes);
                        Session sessionRecheio;
                        sessionRecheio = HibernateUtil.getSession();
                        Transaction tr = sessionRecheio.beginTransaction();
                        sessionRecheio.saveOrUpdate(imagem);
                        tr.commit();
                    }
                }

                //File uploaded successfully
                request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }

        } else {
            request.setAttribute("message",
                    "Sorry this Servlet only handles file upload request");
        }

        //request.getRequestDispatcher("/result.jsp").forward(request, response);
         response.sendRedirect("uparimagem.jsp");

    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("Part Header = " + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
