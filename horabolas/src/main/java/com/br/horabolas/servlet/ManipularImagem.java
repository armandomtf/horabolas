/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas.servlet;

import com.br.horabolas.entidades.Image;
import com.br.horabolas.util.HibernateUtil;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author mandin
 */
public class ManipularImagem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManipularImagem</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManipularImagem at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* creating a blob */
        byte byteArray[] = new byte[10000000];
        for (int i = 0; i < byteArray.length; i++) {
            byteArray[i] = '1';
        }
        Image image = new Image();
        image.setImageasblob(byteArray);  // a blob as byte array
//        image.setImageasblob2(Hibernate.createBlob(byteArray)); // a blob as blob
/* reading */
// read blob from a byte array is as simple as from a bytea
        FileOutputStream outputStream = new FileOutputStream(new File("image_file_blob_array"));
        outputStream.write(image.getImageasblob());
        outputStream.close();
// reading of a blob from a blob is in fact a inputstream
//        outputStream = new FileOutputStream(new File("image_file_blob_blob"));
//        outputStream.write(image.getImageasblob2().getBytes(1, (int) image.getImageasblob2().length()));
//        outputStream.close();
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(image);
            tr.commit();
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
