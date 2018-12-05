/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author aluno
 */
@Entity
@Table (name="grupos")
public class Grupos implements Serializable {

    /**
     * @return the usuario
     */
    public Usuario getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the fkusuario
     */
    public Integer getFkusuario() {
        return fkusuario;
    }

    /**
     * @param fkusuario the fkusuario to set
     */
    public void setFkusuario(Integer fkusuario) {
        this.fkusuario = fkusuario;
    }

    /**
     * @return the data
     */
    public Date getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(Date data) {
        this.data = data;
    }

    /**
     * @return the hora
     */
    public Date getHora() {
        return hora;
    }

    /**
     * @param hora the hora to set
     */
    public void setHora(Date hora) {
        this.hora = hora;
    }
private static final long serialVersionUID = 1L;
    
@Id
@Column(name="cd_nome_grupo")
private Integer nomegrupo;

@OneToMany(cascade=CascadeType.ALL)
@JoinColumn(name="pk_codgrupo")
private Set <Grupos> grupos;

@Column(name="tm_hora")
@Temporal(javax.persistence.TemporalType.TIME)
private Date hora;

@Column(name="dt_data")
@Temporal(javax.persistence.TemporalType.DATE)
private Date data;

@Column(name="usuario_cd_usuario")
private Integer fkusuario;

@ManyToOne
@JoinColumn(name = "codusuario", nullable = false, 
foreignKey=@ForeignKey(name="fk_codusuario"))
private Usuario usuario;
}
