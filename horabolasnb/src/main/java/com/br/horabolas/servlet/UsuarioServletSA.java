package com.br.horabolas.servlet;

import com.br.horabolas.entidades.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UsuarioServletSA extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura parametros da tela
//        String idtext = request.getParameter("pid");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        //Cria instancia do usuario
        Usuario usuario = new Usuario();        
        //Detecta se é usuario novo ou antigo
 //       if(!idtext.isEmpty()){
 //           Integer id = Integer.parseInt(idtext);
//            usuario.setId(id);
  //      }
        //Insere informações no objeto
        usuario.setNome(nome);
        usuario.setSenha(senha);
        usuario.setEmail(email);

        //Chama de funcao para salvar ou atualizar usuario
        UsuarioControle.salvar(usuario);
        
        //Redireciona pagina
        response.sendRedirect("index.html");
    }
}