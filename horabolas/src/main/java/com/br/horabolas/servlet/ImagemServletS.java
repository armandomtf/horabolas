package com.br.horabolas.servlet;

import com.br.horabolas.servlet.ImagemControle;
import com.br.horabolas.entidades.*;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;
public class ImagemServletS extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura arquivo da tela
        Part filePart = request.getPart("imagem");
        if (filePart != null) {
            InputStream inputStream = filePart.getInputStream();
            
            //Instancia imagem e carrega informacoes
            Imagens imagem = new Imagens();            
            imagem.setImagem(IOUtils.toByteArray(inputStream));            
            imagem.setExtensao(filePart.getContentType());
            //Define usuario
            
            ImagemControle.salvar(imagem);
        }
              
        response.sendRedirect("fotolistar.jsp");
    }
}