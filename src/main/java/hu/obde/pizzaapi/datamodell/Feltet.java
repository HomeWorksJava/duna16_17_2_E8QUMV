/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.obde.pizzaapi.datamodell;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author obernay
 */
@Entity
@Table(name="Feltet", uniqueConstraints = {@UniqueConstraint(columnNames = {"feltet"})})
@NamedQueries({        
        @NamedQuery(name = "Feltet.getAll", query = "SELECT f FROM Feltet f order by 1"),
        @NamedQuery(name = "Feltet.getFeltetById", query = "SELECT f FROM Feltet f WHERE f.id = :id"),
        @NamedQuery(name = "Feltet.getFeltetByFeltetNev", query = "SELECT f FROM Feltet f WHERE f.feltet = :feltet")
        })
public class Feltet implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private String feltet;
    
    @ManyToMany
    private List<Pizza> pizza;

    public String getFeltet() {
        return feltet;
    }

    public void setFeltet(String feltet) {
        this.feltet = feltet;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        if (!(object instanceof Feltet)) {
            return false;
        }
        Feltet other = (Feltet) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "hu.obde.pizzaapi.datamodell.Feltet[ id=" + id + " ]";
    }
    
}
