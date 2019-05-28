package com.br.horabolas;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;



    /**
     *
     *@author aluno
     */
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }
    /**
     * @return the cdUsuario
     */
    public Integer getCdUsuario() {
        return cdUsuario;
    }

    /**
     * @param cdUsuario the cdUsuario to set
     */
    public void setCdUsuario(Integer cdUsuario) {
        this.cdUsuario = cdUsuario;
    }

    @Column (name="cd_Usuario")
    private String usuario;
    @Column (name="ds_email")
    private String email;
    @Column (name="ds_cpf")
    private String cpf;
    @Column (name="ds_password")
    private String senha;
    @Id
    @Column(name="cd_usuario")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence_usuario")
    @SequenceGenerator(name = "sequence_usuario", sequenceName = "sq_cd_usuario")
    private Integer cdUsuario;
}