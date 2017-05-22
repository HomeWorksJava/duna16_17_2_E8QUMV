package hu.obde.pizzaapi.resources.jpa;

import hu.obde.pizzaapi.datamodell.Feltet;
import hu.obde.pizzaapi.datamodell.Pizza;
import hu.obde.pizzaapi.resources.api.PizzaService;
import hu.obde.pizzaapi.services.GenericDaoService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author obernay
 */
@Path("pizza")
@RequestScoped
public class PizzaServiceImpl implements PizzaService { 
    
    @Inject
            GenericDaoService gds;    
    Logger log = LoggerFactory.getLogger(this.getClass().getName());
    
    
    
    @GET
    @Path("osszes")    
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    @Override
    public List<Pizza> getAll()
    {
        return gds.getEntities("Pizza.getAll", new HashMap());        
    }

    @POST
    @Path("hozzaad")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    @Override
    // public String insertPizza(String nev, String centimeter, String feltetlista);
    public String insertPizza(@FormParam("pizzanev")String nev, @FormParam("pizzameret")String centimeter, @FormParam("feltet")List<String> sFeltet, @FormParam("pizzaar")String ar) 
    {
            JSONObject returnJsonObj = new JSONObject();
            Logger log = LoggerFactory.getLogger(this.getClass().getName());
         
            Pizza pizza = new Pizza();
            List<Feltet> feltetlista = new ArrayList<>();                        
            
            try
            {   
                
                for(String ertek : sFeltet)
                {
                   Map<String,Object> params = new HashMap<>();
                   params.put("id", Long.parseLong(ertek));                    
                   Feltet tempfeltet = (Feltet) gds.getEntity("Feltet.getFeltetById", params);                           
                  
                   feltetlista.add(tempfeltet);
                }                
                
                pizza.setNev(nev);
                pizza.setCentimeter(Integer.parseInt(centimeter));
                pizza.setFeltetek(feltetlista);
                pizza.setAr(Integer.parseInt(ar));
                
                gds.save(pizza); 
                returnJsonObj.put("success", "sikeres hozzáadás (" + nev + ")");
            }
            catch(NumberFormatException nex)
            {
                returnJsonObj.put("error", "A méret vagy az ár nem szám!");
            }
            catch(Exception ex)
            {
                returnJsonObj.put("error", "Már van ilyen pizza!");
            }
            
        return returnJsonObj.toString();
    }
    
}
