package org.apache.deltaspike.resource;

import com.sun.jersey.api.view.Viewable;
import org.apache.deltaspike.entity.Usuario;
import org.apache.deltaspike.repository.UsuarioRepository;

import javax.annotation.ManagedBean;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Daniel Queiroz
 */
@ManagedBean
@Path("/usuarios")
public class UsuarioResource {

    @Inject
    private UsuarioRepository repository;

    @GET
    public Viewable list() {
        Map model = new HashMap();
        model.put("usuarios", repository.findAll());
        return new Viewable("/usuarioList", model);
    }

    @GET
    @Path("/novo")
    public Viewable form() {
        return new Viewable("/usuarioForm");
    }

    @GET
    @Path("/{id}")
    public Viewable edit(@PathParam("id") Integer id) {
        Map model = new HashMap();
        model.put("usuario", repository.findBy(id));
        return new Viewable("/usuarioForm", model);
    }

    @POST
    @Transactional
    public Response save(Usuario usuario) {
        repository.saveAndFlush(usuario);
        return Response.ok().build();
    }

    @DELETE
    @Path("/{id}/{version}")
    @Transactional
    public Response delete(@PathParam("id") Integer id, @PathParam("version") Integer version) {
        Usuario usuario = repository.findBy(id);
        usuario.setVersion(version);
        repository.removeAndFlush(usuario);
        return Response.ok().build();
    }
}
