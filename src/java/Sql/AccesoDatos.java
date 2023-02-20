/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sql;

import static java.lang.System.out;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Victor
 */
public class AccesoDatos extends Conexion{
    
    private ResultSet resultado;
    
    public AccesoDatos()
    {
        Conectar();
    }
    
    public ResultSet ListadoUser(int consulta)
    {
        try{
            st();
            switch (consulta) { 
            case 1:
            // secuencia de sentencias.
                {
                resultado = st.executeQuery("select * from usuario;");
            }
            break;
            case 2:
            // secuencia de sentencias.
                {resultado=st.executeQuery("SELECT u.NombreUsuario,u.correo,r.nombre,r.descripcion, case u.estado when 1 then 'Activo' else 'Desactivo' end Estado FROM usuario u, roles r where u.Roles_idRoles = r.idRoles;");
            }
            break;
    
            case 3 :
            // secuencia de sentencias.
                {resultado=st.executeQuery("select ID_Ejemplo,date(fecha) fecha,sum(Denuncias) CantidadDenuncias,Departamento  from denuncias.history_example group by ID_Ejemplo,date(fecha),Departamento order by fecha desc;");
            }
            break;
            case 4:
            // secuencia de sentencias.
                {resultado=st.executeQuery("select ID_Ejemplo,date(fecha) fecha,sum(Denuncias) CantidadDenuncias,Departamento  from denuncias.history_example group by ID_Ejemplo,date(fecha),Departamento order by fecha desc;");
            }
            break;
            default:
                // Default secuencia de sentencias.
               out.println("Consulta no encontrada");           
                                }
            
            return resultado;
        }
        catch (Exception e) 
        {
        System.err.println("Error" + e.getMessage());  
        }
        return null;
    }

public ResultSet ActualizarUser(int consulta,String valor1,String valor2,String valor3)
    {
 try{
            st();
            switch (consulta) { 
            case 1:
            // secuencia de sentencias.
                {
                st.executeUpdate("update usuario set clave ='"+ valor1+"' where idUsuario ="+valor2+" and NombreUsuario='"+valor3+"';");
                
                }
            break;
            default:
                // Default secuencia de sentencias.
               out.println("Consulta no encontrada");           
                                }
            
            return resultado;
        }
        catch (Exception e) 
        {
        System.err.println("Error" + e.getMessage());  
        }
       return null;
    }
    
    
    
}
