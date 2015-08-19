package org.apache.deltaspike.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Daniel Queiroz
 */
@MappedSuperclass
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Model<PK extends Serializable> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected PK id;

    @Version
    protected Integer version;

    public PK getId() {
        return id;
    }

    public void setId(PK id) {
        this.id = id;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
}
