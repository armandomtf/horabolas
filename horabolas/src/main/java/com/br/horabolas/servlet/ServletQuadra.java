package com.br.horabolas.servlet;

import com.br.horabolas.entidades.Quadras;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletQuadra extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idtext = request.getParameter("pid");
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String imagem = request.getParameter("imagem");
        

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
        //quadra.setImagem(imagem);

        //Chama de funcao para salvar ou atualizar usuario
        ControladorDB.salvarquadra(quadra);
        response.sendRedirect("index.html");

    }
}
