package org.apache.deltaspike;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * @author Daniel Queiroz
 */
public class EntityManagerCreator {

    @Produces
    @ApplicationScoped
    public EntityManagerFactory createEntityManagerFactory() {
        return Persistence.createEntityManagerFactory("default");
    }

    @Produces
    @RequestScoped
    public EntityManager createEntityManager(EntityManagerFactory factory) {
        return factory.createEntityManager();
    }

    public void destroyEntityManagerFactory(@Disposes EntityManagerFactory factory) {
        if (factory.isOpen()) {
            factory.close();
        }
    }

    public void destroy(@Disposes EntityManager manager) {
        if (manager.isOpen()) {
            manager.close();
        }
    }

}
