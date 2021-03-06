package com.br.horabolas.servlet;

import com.br.horabolas.entidades.Agendamento;
import com.br.horabolas.entidades.Quadras;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.br.horabolas.util.HibernateUtil;

public class AgendamentoControle {

    //Função de salvar/atualizar um usuario
    public static boolean salvarquadra(Quadras quadra) {
        try {
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(quadra);
            tr.commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    //Localiza um usuario pelo id
    public static Quadras buscar(Integer id) {
        String idQuadra = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Quadras q where q.id='" + idQuadra + "'";
        Quadras quadra = (Quadras) sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return quadra;
    }

    public static List<Agendamento> listaragendamentosfull() {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Agendamento a";
        List<Agendamento> lista = (List) sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }
    
    public static List<Agendamento> listaragendamentos(Integer idUsuario) {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Agendamento a where a.idUsuarioIda.id=" + idUsuario.toString();
        List<Agendamento> lista = (List) sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }

    public static List<Quadras> listarquadrasagendadas(Integer idQuadra) {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Agendamento a where a.idQuadraIda.id=" + idQuadra.toString();
        List<Quadras> lista = (List) sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }

    //Função de apagar um usuario
    public static boolean deletara(Agendamento a) {
        try {
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(a);
            tr.commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}
