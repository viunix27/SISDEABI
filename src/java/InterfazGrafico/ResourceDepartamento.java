/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/GenericResource.java to edit this template
 */
package InterfazGrafico;

import com.google.gson.Gson;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Victor
 */
@Path("historialDepar")
public class ResourceDepartamento {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of ResourceDepartamento
     */
    public ResourceDepartamento() {
    }

    /**
     * Retrieves representation of an instance of InterfazGrafico.ResourceDepartamento
     * @return an instance of java.lang.String
     */
   
    @GET
    @Produces("text/html")
    public String getHtml2()
    {
            List<HistoricoDepartamento> historicoD = new Service().listarHistoricoDepartamento();
            String json = new Gson().toJson(historicoD);
    return json;
    }
    
}
