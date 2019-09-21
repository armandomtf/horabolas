/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mandin
 */
@Entity
@Table(name = "quadras")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Quadras.findAll", query = "SELECT q FROM Quadras q")
    , @NamedQuery(name = "Quadras.findByNome", query = "SELECT q FROM Quadras q WHERE q.nome = :nome")
    , @NamedQuery(name = "Quadras.findById", query = "SELECT q FROM Quadras q WHERE q.id = :id")
    , @NamedQuery(name = "Quadras.findByDescricao", query = "SELECT q FROM Quadras q WHERE q.descricao = :descricao")})
public class Quadras implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 40)
    @Column(name = "nome")
    private String nome;
     @Id
    @Basic(optional = false)    
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name="meugerador", sequenceName = "sq_quadra")
    @Column(name = "id")
    private Integer id;
    @Lob
    @Column(name = "imagem")
    private byte[] imagem;
    @Size(max = 2147483647)
    @Column(name = "descricao")
    private String descricao;

    public Quadras() {
    }

    public Quadras(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Quadras)) {
            return false;
        }
        Quadras other = (Quadras) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.br.horabolas.entidades.Quadras[ id=" + id + " ]";
    }
    
}