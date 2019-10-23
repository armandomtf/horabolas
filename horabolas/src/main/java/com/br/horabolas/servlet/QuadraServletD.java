package com.br.horabolas.servlet;

import com.br.horabolas.entidades.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuadraServletD extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura id da tela
        String idqtext = request.getParameter("pidq");
        Quadras quadra  = new Quadras();
        quadra.setId(Integer.parseInt(idqtext));
        QuadraControle.deletarq(quadra);
        //Redireciona pagina
        response.sendRedirect("listar.jsp");
    }
}
