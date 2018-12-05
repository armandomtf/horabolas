package com.br.horabolas;

import com.br.horabolas.Agendamento;
import com.br.horabolas.Grupos;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-12-05T18:27:54")
@StaticMetamodel(Agendamento.class)
public class Agendamento_ { 

    public static volatile SingularAttribute<Agendamento, Date> fiinal;
    public static volatile SetAttribute<Agendamento, Agendamento> agendamentos;
    public static volatile SingularAttribute<Agendamento, Boolean> aprovado;
    public static volatile SingularAttribute<Agendamento, Grupos> grupos;
    public static volatile SingularAttribute<Agendamento, Date> inicial;
    public static volatile SingularAttribute<Agendamento, Date> agendamento;

}