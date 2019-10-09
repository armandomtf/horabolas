
package com.br.horabolas.servlet;

import com.br.horabolas.entidades.*;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.br.horabolas.util.HibernateUtil;

public class ImagemControle {

    //Função de salvar uma imagem
    public static boolean salvar(Imagens imagem){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(imagem);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }
    
    //Localiza uma imagem pelo id
    public static Imagens buscar(Integer id)
    {
        String idImagens = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Imagens f where f.id='"+idImagens+"'";
        Imagens imagem = (Imagens)sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return imagem;
    }
    
    //Retorna todas as imagems de um usuario do sistema
    public static List<Imagens> listar()
    {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Imagens f";
        List<Imagens> lista = (List)sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }
    
    //Função de apagar um usuario
    public static boolean deletar(Imagens imagem){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(imagem);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }    
}
