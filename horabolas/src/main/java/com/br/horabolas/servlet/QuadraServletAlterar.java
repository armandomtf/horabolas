package com.br.horabolas.servlet;

import com.br.horabolas.entidades.*;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

public class QuadraServletAlterar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura parametros da tela
        String idtext = request.getParameter("pid");
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        Part filePart = request.getPart("foto");
        

        //Cria instancia do usuario
        Quadras q = new Quadras();
        //Detecta se é usuario novo ou antigo
        if (!idtext.isEmpty()) {
            Integer id = Integer.parseInt(idtext);
            q.setId(id);
        }
        //Insere informações no objeto
        q.setNome(nome);
        q.setDescricao(descricao);
        
       
        long tamPart = filePart.getSize();
            if(tamPart > 0 ){
            InputStream inputStream = filePart.getInputStream();
            q.setFoto(IOUtils.toByteArray(inputStream));
            q.setExtensao(filePart.getContentType());

            }
        //Chama de funcao para salvar ou atualizar usuario
        QuadraControle.salvarquadra(q);

        //Redireciona pagina
        response.sendRedirect("listar.jsp");
    }
}
