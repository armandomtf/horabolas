/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas.util;

import com.br.horabolas.Usuario;
import java.time.Instant;
import java.util.Date;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.SettingsFactory;

public class HibernateUtil {

    private static final SessionFactory concreteSessionFactory;

    static {
        try {
            concreteSessionFactory = new AnnotationConfiguration()
                    .configure()
                    .addAnnotatedClass(Usuario.class)
                    .buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession()
            throws HibernateException {
        return concreteSessionFactory.openSession();
    }

    public static void main(String... args) {
        Session session = getSession();
        Transaction tr = session.beginTransaction();
        Usuario user;
        user = (Usuario) session.get(Usuario.class, new Integer(1));
        if (user == null) {
            System.out.println("Usuário não encontrado.");
        } else {
            System.out.println("Nome: "+user.getNome());
        }
        
        Usuario usuario = new Usuario();
        usuario.setEmail("jogador@hb.com");
        usuario.setNome("jogador");
        usuario.setCpf("00000000000");
        usuario.setSobrenome("10");
        usuario.setSenha("123");
        
        session.save(usuario);
        tr.commit();
        
        session.close();
    }
}
