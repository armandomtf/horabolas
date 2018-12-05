/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author aluno
 */

@Entity
@Table(name="agendamento")
public class Agendamento {

    /**
     * @return the agendamento
     */
    public Date getAgendamento() {
        return agendamento;
    }

    /**
     * @param agendamento the agendamento to set
     */
    public void setAgendamento(Date agendamento) {
        this.agendamento = agendamento;
    }

    /**
     * @return the inicial
     */
    public Date getInicial() {
        return inicial;
    }

    /**
     * @param inicial the inicial to set
     */
    public void setInicial(Date inicial) {
        this.inicial = inicial;
    }

    /**
     * @return the fiinal
     */
    public Date getFiinal() {
        return fiinal;
    }

    /**
     * @param fiinal the fiinal to set
     */
    public void setFiinal(Date fiinal) {
        this.fiinal = fiinal;
    }

    /**
     * @return the aprovado
     */
    public Boolean getAprovado() {
        return aprovado;
    }

    /**
     * @param aprovado the aprovado to set
     */
    public void setAprovado(Boolean aprovado) {
        this.aprovado = aprovado;
    }

    /**
     * @return the agendamentos
     */
    public Set <Agendamento> getAgendamentos() {
        return agendamentos;
    }

    /**
     * @param agendamentos the agendamentos to set
     */
    public void setAgendamentos(Set <Agendamento> agendamentos) {
        this.agendamentos = agendamentos;
    }

 
@Id
@Column(name="dt_agendamento")
@Temporal(javax.persistence.TemporalType.DATE)
private Date agendamento;

@Column(name="tm_inicial")
@Temporal(javax.persistence.TemporalType.TIME)
private Date inicial;

@Column(name="tm_final")
@Temporal(javax.persistence.TemporalType.TIME)
private Date fiinal;

@OneToMany(cascade=CascadeType.ALL)
@JoinColumn(name="pk_codagendamento")
private Set <Agendamento> agendamentos;

@Column(name="id_aprovado")
private Boolean aprovado;

@ManyToOne
@JoinColumn(name = "codgrupo", nullable = false, 
foreignKey=@ForeignKey(name="fk_codgrupo"))
private Grupos grupos;

    
}
