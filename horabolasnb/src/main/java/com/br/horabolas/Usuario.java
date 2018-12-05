package com.br.horabolas;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

public class Usuario {


    /**
     *
     *@author aluno
     */
    @Entity
@Table(name = "usuario")
public class usuario implements Serializable {

        
        
        
        
        /**
         * @return the codusuario
         */
        public Set <Usuario> getCodusuario() {
            return codusuario;
        }

        /**
         * @param codusuario the codusuario to set
         */
        public void setCodusuario(Set <Usuario> codusuario) {
            this.codusuario = codusuario;
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
     * @return the email
     */
    public Integer getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(Integer email) {
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
     * @return the usuario
     */
    public Integer getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(Integer usuario) {
        this.usuario = usuario;
    }


    /**
     * @param usuario
     */
    public void setUsuario(int usuario) {
        this.setUsuario((Integer) usuario);
    }
    @Id
    @Column (name="cd_usuario")
    private Integer usuario; 
    @Column (name="nm_name")
    private String nome;
    @Column (name="cd_email")
    private Integer email;
    @Column (name="ds_senha")
    private String senha;
    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="pk_codusuario")
    private Set <Usuario> codusuario;

}
}