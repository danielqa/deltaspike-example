package org.apache.deltaspike.repository;

import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Query;
import org.apache.deltaspike.data.api.Repository;
import org.apache.deltaspike.entity.Usuario;

import java.util.List;

/**
 * @author Daniel Queiroz
 */
@Repository
public interface UsuarioRepository extends EntityRepository<Usuario, Integer> {

    List<Usuario> findByNome(String nome);

    @Query("select u from Usuario u where u.id = ?1")
    Usuario findById(Integer id);

}
