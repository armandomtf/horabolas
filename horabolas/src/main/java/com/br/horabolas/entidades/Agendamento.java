/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas.entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mandin
 */
@Entity
@Table(name = "agendamento")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Agendamento.findAll", query = "SELECT a FROM Agendamento a")
    , @NamedQuery(name = "Agendamento.findByIda", query = "SELECT a FROM Agendamento a WHERE a.ida = :ida")
    , @NamedQuery(name = "Agendamento.findByDataUso", query = "SELECT a FROM Agendamento a WHERE a.dataUso = :dataUso")
    , @NamedQuery(name = "Agendamento.findByAprovacao", query = "SELECT a FROM Agendamento a WHERE a.aprovacao = :aprovacao")})
public class Agendamento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name = "meugerador", sequenceName = "sq_agendamento")
    @Column(name = "ida")
    private Integer ida;
    @Column(name = "data_uso")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataUso;
    @Size(max = 2147483647)
    @Column(name = "aprovacao")
    private String aprovacao;
    @JoinColumn(name = "id_usuario_ida", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Usuario idUsuarioIda;

    public Agendamento() {
    }

    public Agendamento(Integer ida) {
        this.ida = ida;
    }

    public Integer getIda() {
        return ida;
    }

    public void setIda(Integer ida) {
        this.ida = ida;
    }

    public Date getDataUso() {
        return dataUso;
    }

    public void setDataUso(Date dataUso) {
        this.dataUso = dataUso;
    }

    public String getAprovacao() {
        return aprovacao;
    }

    public void setAprovacao(String aprovacao) {
        this.aprovacao = aprovacao;
    }

    public Usuario getIdUsuarioIda() {
        return idUsuarioIda;
    }

    public void setIdUsuarioIda(Usuario idUsuarioIda) {
        this.idUsuarioIda = idUsuarioIda;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ida != null ? ida.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Agendamento)) {
            return false;
        }
        Agendamento other = (Agendamento) object;
        if ((this.ida == null && other.ida != null) || (this.ida != null && !this.ida.equals(other.ida))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.br.horabolas.entidades.Agendamento[ ida=" + ida + " ]";
    }

}
