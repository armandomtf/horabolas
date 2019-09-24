package com.br.horabolas.servlet;

import com.br.horabolas.entidades.Usuarioadm;
import com.br.horabolas.util.HibernateUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

public class UsuarioAdmServletLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura parametros da tela
        String idtext = request.getParameter("pid");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Session session = HibernateUtil.getSession();
        Usuarioadm usuarioadm = (Usuarioadm) session.createQuery("from Usuarioadm where email=? and senha=?").setString(0, email).setString(1, senha).uniqueResult();
        session.close();

        if (usuarioadm == null) {
            response.sendRedirect("index.html");
        } else {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("UsuarioAdmLogado", usuarioadm);
            response.sendRedirect("principaladm.jsp");

        }
    }
}
