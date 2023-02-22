/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sql;

import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Victor
 */
public class AccesoDatos extends Conexion{
    
    private ResultSet resultado=null;
    
    public AccesoDatos()
    {
        Conectar();
    }
    
    public ResultSet ListadoUser(int consulta)
    {
        try{
            st();
            resultado=null;
            switch (consulta) { 
            case 1:
            // secuencia de sentencias.
                {
                resultado = st.executeQuery("select * from denuncias.usuario;");
            }
            break;
            case 2:
            // secuencia de sentencias.
                {resultado=st.executeQuery("SELECT u.IdUsuario,u.NombreUsuario,u.correo,r.nombre,r.descripcion, case u.estado when 1 then 'Activo' when 2 then 'Nuevo' when 0 then 'Desactivo' else 'Indefinido' end Estado FROM denuncias.usuario u, denuncias.roles r where u.Roles_idRoles = r.idRoles;");
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
             case 5:
            // Cuenta los usuarios Activos
                {
                resultado = st.executeQuery("select count(*)C_Activos from denuncias.usuario where estado=1;");
                
            } break;
             case 6:
            // Cuenta los usuarios Nuevos
                {
                resultado = st.executeQuery("select count(*)C_Nuevos from denuncias.usuario where estado=2;");
            }  break;
             case 7:
            // Cuenta los usuarios desactivos
                {
                resultado = st.executeQuery("select count(*)C_Desactivos from denuncias.usuario where estado=0;");
            } break;
             case 8:
            // secuencia de sentencias.
                {
                resultado = st.executeQuery("select sum(denuncias)C_Abigeato_MES from denuncias.history_example where date_format(fecha,'%y%m%d') between '220801' and '230214';");
            } break;
            default:
                // Default secuencia de sentencias.
               out.println("Consulta no encontrada");           
                     break;
            }
            
            return resultado;
        }
        catch (SQLException e) 
        {
        System.err.println("Error" + e.getMessage());  
        }
        return null;
    }

public ResultSet ActualizarUser(int consulta,String valor1,String valor2,String valor3)
    {
 try{
            st();
            int estadoid=99;
            switch (consulta) { 
            case 1:
            // secuencia de sentencias.
                {
                st.executeUpdate("update denuncias.usuario set clave ='"+ valor1+"' where idUsuario ="+valor2+" and NombreUsuario='"+valor3+"';");
                
                }
            break;
            case 2:
            // secuencia de sentencias.
                
                {
            if(valor1.equals("Activo")){
                        estadoid =1;           
                        }
                else if (valor1.equals("Desactivo"))
                    {
                    estadoid =0;
                    } 
                    else if (valor1.equals("Nuevo")){
                         estadoid =2;
                        }
                st.executeUpdate("update denuncias.usuario set estado ='"+ estadoid+"' where idUsuario ="+valor2+" and NombreUsuario='"+valor3+"';");
                conn.commit();
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
