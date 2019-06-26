/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
    , @NamedQuery(name = "Usuario.findByDsSenha", query = "SELECT u FROM Usuario u WHERE u.dsSenha = :dsSenha")
    , @NamedQuery(name = "Usuario.findByDsEmail", query = "SELECT u FROM Usuario u WHERE u.dsEmail = :dsEmail")
    , @NamedQuery(name = "Usuario.findByDsCpf", query = "SELECT u FROM Usuario u WHERE u.dsCpf = :dsCpf")
    , @NamedQuery(name = "Usuario.findByNmName", query = "SELECT u FROM Usuario u WHERE u.nmName = :nmName")
    , @NamedQuery(name = "Usuario.findByNmNick", query = "SELECT u FROM Usuario u WHERE u.nmNick = :nmNick")
    , @NamedQuery(name = "Usuario.findByCdUsuario", query = "SELECT u FROM Usuario u WHERE u.cdUsuario = :cdUsuario")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @NotNull
    @Size(max = 2147483647)
    @Column(name = "ds_senha")
    private String dsSenha;
    @NotNull
    @Size(max = 2147483647)
    @Column(name = "ds_email")
    private String dsEmail;
    @NotNull
    @Size(max = 2147483647)
    @Column(name = "nm_name")
    private String nmName;
    @NotNull
    @Size(max = 2147483647)
    @Column(name = "nm_nick")
    private String nmNick;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @NotNull
    @Column(name = "cd_usuario", unique=true, nullable=false)
    private Integer cdUsuario;

    public Usuario() {
    }

    public Usuario(Integer cdUsuario) {
        this.cdUsuario = cdUsuario;
    }

    public String getDsSenha() {
        return dsSenha;
    }

    public void setDsSenha(String dsSenha) {
        this.dsSenha = dsSenha;
    }

    public String getDsEmail() {
        return dsEmail;
    }

    public void setDsEmail(String dsEmail) {
        this.dsEmail = dsEmail;
    }

    

    public String getNmName() {
        return nmName;
    }

    public void setNmName(String nmName) {
        this.nmName = nmName;
    }

    public String getNmNick() {
        return nmNick;
    }

    public void setNmNick(String nmNick) {
        this.nmNick = nmNick;
    }

    public Integer getCdUsuario() {
        return cdUsuario;
    }

    public void setCdUsuario(Integer cdUsuario) {
        this.cdUsuario = cdUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cdUsuario != null ? cdUsuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.cdUsuario == null && other.cdUsuario != null) || (this.cdUsuario != null && !this.cdUsuario.equals(other.cdUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Usuario[ cdUsuario=" + cdUsuario + " ]";
    }
    
}
