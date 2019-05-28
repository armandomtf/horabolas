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
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the sobrenome
     */
    public String getSobrenome() {
        return sobrenome;
    }

    /**
     * @param sobrenome the sobrenome to set
     */
    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
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

    @Column (name="ds_email")
    private String email;
    @Column(name = "nm_name")
    private String nome;
    @Column (name="nm_lastname")
    private String sobrenome;
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