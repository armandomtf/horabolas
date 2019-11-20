/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas.servlet;

import com.br.horabolas.entidades.Agendamento;
import com.br.horabolas.util.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author mandin
 */
public class AgendamentoRejeitar extends HttpServlet {

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
            out.println("<title>Servlet AgendamentoRejeitar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AgendamentoRejeitar at " + request.getContextPath() + "</h1>");
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
        String idAgendamento = request.getParameter("pid");
        Agendamento a = new Agendamento();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        String hql = "from Agendamento a where a.ida='" + idAgendamento + "'";
        a = (Agendamento) sessionRecheio.createQuery(hql).uniqueResult();
        a.setAprovacao("Rejeitado");
        a.setDataQuadra(a.getDataQuadra());
        a.setIdQuadraIda(a.getIdQuadraIda());
        a.setDataUso(a.getDataUso());
        a.setIdUsuarioIda(a.getIdUsuarioIda());

        Transaction tr = sessionRecheio.beginTransaction();
        sessionRecheio.saveOrUpdate(a);
        tr.commit();
        sessionRecheio.close();
        response.sendRedirect("aprovacao.jsp");
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
