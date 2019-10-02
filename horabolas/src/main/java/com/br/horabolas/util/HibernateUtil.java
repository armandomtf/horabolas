/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas.util;

import com.br.horabolas.entidades.Image;
import com.br.horabolas.entidades.Quadras;
import com.br.horabolas.entidades.Usuario;
import com.br.horabolas.entidades.Usuarioadm;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {

//    private static final SessionFactory sessionFactory;
//    static {
//        try {
//            sessionFactory = new AnnotationConfiguration()
//                    .configure().buildSessionFactory();
//        } catch (Throwable ex) {
//            // Log exception!
//            throw new ExceptionInInitializerError(ex);
//        }
//    }
//
//    public static Session getSession()
//            throws HibernateException {
//        return sessionFactory.openSession();
//    }
    private static SessionFactory factory;

    static {
        AnnotationConfiguration cfg = new AnnotationConfiguration();
        cfg.configure();
        cfg.addAnnotatedClass(Usuario.class);
        cfg.addAnnotatedClass(Image.class);
        cfg.addAnnotatedClass(Usuarioadm.class);
        cfg.addAnnotatedClass(Quadras.class);
        factory = cfg.buildSessionFactory();
    }

    public static Session getSession() {
        return factory.openSession();
    }
}
