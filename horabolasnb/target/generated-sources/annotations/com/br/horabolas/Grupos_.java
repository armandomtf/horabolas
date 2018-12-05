package com.br.horabolas;

import com.br.horabolas.Grupos;
import com.br.horabolas.Usuario;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-12-05T18:27:54")
@StaticMetamodel(Grupos.class)
public class Grupos_ { 

    public static volatile SingularAttribute<Grupos, Date> data;
    public static volatile SingularAttribute<Grupos, Date> hora;
    public static volatile SetAttribute<Grupos, Grupos> grupos;
    public static volatile SingularAttribute<Grupos, Usuario> usuario;
    public static volatile SingularAttribute<Grupos, Integer> nomegrupo;
    public static volatile SingularAttribute<Grupos, Integer> fkusuario;

}