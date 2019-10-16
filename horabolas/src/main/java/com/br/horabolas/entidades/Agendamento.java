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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "agendamento")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Agendamento.findAll", query = "SELECT a FROM Agendamento a")
    , @NamedQuery(name = "Agendamento.findByIda", query = "SELECT a FROM Agendamento a WHERE a.ida = :ida")
    , @NamedQuery(name = "Agendamento.findByData", query = "SELECT a FROM Agendamento a WHERE a.data = :data")
    , @NamedQuery(name = "Agendamento.findByIdUsuarioIda", query = "SELECT a FROM Agendamento a WHERE a.idUsuarioIda = :idUsuarioIda")})
public class Agendamento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name = "meugerador", sequenceName = "sq_agendamento")
    @Column(name = "ida")
    private Integer ida;
    @Column(name = "data")
    @Temporal(TemporalType.TIMESTAMP)
    private Date data;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_usuario_ida")
    private int idUsuarioIda;
    @JoinColumn(name = "ida", referencedColumnName = "id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    
    private Usuario usuario;

    public Agendamento() {
    }

    public Agendamento(Integer ida) {
        this.ida = ida;
    }

    public Agendamento(Integer ida, int idUsuarioIda) {
        this.ida = ida;
        this.idUsuarioIda = idUsuarioIda;
    }

    public Integer getIda() {
        return ida;
    }

    public void setIda(Integer ida) {
        this.ida = ida;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public int getIdUsuarioIda() {
        return idUsuarioIda;
    }

    public void setIdUsuarioIda(int idUsuarioIda) {
        this.idUsuarioIda = idUsuarioIda;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
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
