package org.apache.deltaspike.entity;

import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

/**
 * @author Daniel Queiroz
 */
@Entity
public class Usuario extends Model<Integer> {

    private String nome;

    @Temporal(TemporalType.DATE)
    private Date data;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
}
