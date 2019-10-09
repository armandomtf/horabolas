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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "imagens")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Imagens.findAll", query = "SELECT i FROM Imagens i")
    , @NamedQuery(name = "Imagens.findByCdImagem", query = "SELECT i FROM Imagens i WHERE i.cdImagem = :cdImagem")
    , @NamedQuery(name = "Imagens.findByExtensao", query = "SELECT i FROM Imagens i WHERE i.extensao = :extensao")})
public class Imagens implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name = "meugerador", sequenceName = "sq_imagem")
    @Column(name = "cd_imagem")
    private Integer cdImagem;
    //@Lob
    @Column(name = "imagem")
    private byte[] imagem;
    @Size(max = 2147483647)
    @Column(name = "extensao")
    private String extensao;

    public Imagens() {
    }

    public Imagens(Integer cdImagem) {
        this.cdImagem = cdImagem;
    }

    public Integer getCdImagem() {
        return cdImagem;
    }

    public void setCdImagem(Integer cdImagem) {
        this.cdImagem = cdImagem;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    public String getExtensao() {
        return extensao;
    }

    public void setExtensao(String extensao) {
        this.extensao = extensao;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cdImagem != null ? cdImagem.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Imagens)) {
            return false;
        }
        Imagens other = (Imagens) object;
        if ((this.cdImagem == null && other.cdImagem != null) || (this.cdImagem != null && !this.cdImagem.equals(other.cdImagem))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.br.horabolas.entidades.Imagens[ cdImagem=" + cdImagem + " ]";
    }
    
}
