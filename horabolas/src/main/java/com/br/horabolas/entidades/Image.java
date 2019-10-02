/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.horabolas.entidades;

import java.io.Serializable;
import java.sql.Blob;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mandin
 */
@Entity
@Table(name = "image")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Image.findAll", query = "SELECT i FROM Image i")
    , @NamedQuery(name = "Image.findByCodImagem", query = "SELECT i FROM Image i WHERE i.codImagem = :codImagem")
    , @NamedQuery(name = "Image.findByImageasblob2", query = "SELECT i FROM Image i WHERE i.imageasblob2 = :imageasblob2")})
public class Image implements Serializable {


    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name = "meugerador", sequenceName = "sq_imagem")
    @Column(name = "cod_imagem")
    private Integer codImagem;
    @Lob
    @Column(name = "imageasblob")
    private byte[] imageasblob;
    @Column(name = "imageasblob2")
    private Blob imageasblob2;

    public Image() {
    }

    public Image(Integer codImagem) {
        this.codImagem = codImagem;
    }

    public Integer getCodImagem() {
        return codImagem;
    }

    public void setCodImagem(Integer codImagem) {
        this.codImagem = codImagem;
    }

    public byte[] getImageasblob() {
        return imageasblob;
    }

    public void setImageasblob(byte[] imageasblob) {
        this.imageasblob = imageasblob;
    }

    public Blob getImageasblob2() {
        return imageasblob2;
    }
    public void setImageasblob2(Blob imageasblob2) {
        this.imageasblob2 = imageasblob2;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codImagem != null ? codImagem.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Image)) {
            return false;
        }
        Image other = (Image) object;
        if ((this.codImagem == null && other.codImagem != null) || (this.codImagem != null && !this.codImagem.equals(other.codImagem))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.br.horabolas.entidades.Image[ codImagem=" + codImagem + " ]";
    }
    
}
