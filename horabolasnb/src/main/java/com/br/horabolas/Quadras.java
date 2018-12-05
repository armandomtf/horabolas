/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;


/**
 *
 * @author aluno
 */

@Entity
@Table (name="quadras")
public class Quadras {

    /**
     * @return the grupo
     */
    public Integer getGrupo() {
        return grupo;
    }

    /**
     * @param grupo the grupo to set
     */
    public void setGrupo(Integer grupo) {
        this.grupo = grupo;
    }

    /**
     * @return the grupos
     */
    public Grupos getGrupos() {
        return grupos;
    }

    /**
     * @param grupos the grupos to set
     */
    public void setGrupos(Grupos grupos) {
        this.grupos = grupos;
    }

    /**
     * @return the nomequadra
     */
    public String getNomequadra() {
        return nomequadra;
    }

    /**
     * @param nomequadra the nomequadra to set
     */
    public void setNomequadra(String nomequadra) {
        this.nomequadra = nomequadra;
    }

    /**
     * @return the horadisponivelfinal
     */
    public Date getHoradisponivelfinal() {
        return horadisponivelfinal;
    }

    /**
     * @param horadisponivelfinal the horadisponivelfinal to set
     */
    public void setHoradisponivelfinal(Date horadisponivelfinal) {
        this.horadisponivelfinal = horadisponivelfinal;
    }

    /**
     * @return the horadisponivelinicial
     */
    public Date getHoradisponivelinicial() {
        return horadisponivelinicial;
    }

    /**
     * @param horadisponivelinicial the horadisponivelinicial to set
     */
    public void setHoradisponivelinicial(Date horadisponivelinicial) {
        this.horadisponivelinicial = horadisponivelinicial;
    }
@Column(name="tm_hrdispinicial")
@Temporal(javax.persistence.TemporalType.TIME)
private Date horadisponivelinicial;

@Column(name="tm_hrdispfinal")
@Temporal(javax.persistence.TemporalType.TIME)
private Date horadisponivelfinal;

@Id
@Column (name="nm_quadra")
private String nomequadra;

@Column (name="grupo_cd_grupo")
private Integer grupo;

@ManyToOne
@JoinColumn(name = "codgrupoo", nullable = false, 
foreignKey=@ForeignKey(name="fk_codgrupo"))
private Grupos grupos;

}
