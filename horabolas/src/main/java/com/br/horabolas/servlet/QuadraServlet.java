package com.br.horabolas.servlet;

import com.br.horabolas.entidades.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import java.io.InputStream;
import javax.servlet.http.Part;

public class QuadraServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idtext = request.getParameter("pid");
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        Part filePart = request.getPart("foto");
        InputStream inputStream = filePart.getInputStream();
        

        //Cria instancia do usuario
        Quadras quadra = new Quadras();
        //Detecta se é usuario novo ou antigo
        if (!idtext.isEmpty()) {
            Integer id = Integer.parseInt(idtext);
            quadra.setId(id);
        }
        //Insere informações no objeto
        quadra.setNome(nome);
        quadra.setDescricao(descricao);
        quadra.setFoto(IOUtils.toByteArray(inputStream));            
        quadra.setExtensao(filePart.getContentType());

        //Chama de funcao para salvar ou atualizar usuario
        QuadraControle.salvarquadra(quadra);
        response.sendRedirect("agendamentoadm.jsp");

    }
}
