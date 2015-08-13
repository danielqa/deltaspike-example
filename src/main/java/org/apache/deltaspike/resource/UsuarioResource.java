package org.apache.deltaspike.resource;

import com.sun.jersey.api.view.Viewable;
import org.apache.deltaspike.repository.UsuarioRepository;

import javax.annotation.ManagedBean;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Daniel Queiroz
 */
@ManagedBean
@Path("/usuarios")
public class UsuarioResource {

    @Inject
    private UsuarioRepository usuarioRepository;

    @GET
    @Path("/{id}")
    public Viewable usuarioForm(@PathParam("id") Integer id) {
        Map model = new HashMap();
        model.put("usuario", usuarioRepository.findBy(id));
        return new Viewable("/usuarioForm", model);
    }

}
