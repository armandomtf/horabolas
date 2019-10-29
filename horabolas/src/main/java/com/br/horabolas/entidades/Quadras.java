package com.br.horabolas.entidades;

import java.io.Serializable;
import java.util.Base64;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
//import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

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
    , @NamedQuery(name = "Quadras.findByDescricao", query = "SELECT q FROM Quadras q WHERE q.descricao = :descricao")
    , @NamedQuery(name = "Quadras.findByExtensao", query = "SELECT q FROM Quadras q WHERE q.extensao = :extensao")})
public class Quadras implements Serializable {
    private static final long serialVersionUID = 1L;
    //@Lob
    @Column(name = "foto")
    private byte[] foto;
    @Size(max = 40)
    @Column(name = "nome")
    private String nome;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name = "meugerador", sequenceName = "sq_quadra")
    @Column(name = "id")
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "descricao")
    private String descricao;
    @Size(max = 2147483647)
    @Column(name = "extensao")
    private String extensao;

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

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
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

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

}
