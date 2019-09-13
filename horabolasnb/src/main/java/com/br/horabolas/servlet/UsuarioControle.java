package com.br.horabolas.servlet;

import com.br.horabolas.entidades.Usuario;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.br.horabolas.util.HibernateUtil;

public class UsuarioControle {

    //Função de salvar/atualizar um usuario
    public static boolean salvar(Usuario usuario){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(usuario);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }
    
    //Localiza um usuario pelo id
    public static Usuario buscar(Integer id)
    {
        String idUsuario = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Usuario u where u.id='"+idUsuario+"'";
        Usuario usuario = (Usuario)sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return usuario;
    }
    
    //Retorna todos os usuario do sistema
    public static List<Usuario> listar()
    {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Usuario u";
        List<Usuario> lista = (List)sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }
    
    //Função de apagar um usuario
    public static boolean deletar(Usuario usuario){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(usuario);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }    
}
