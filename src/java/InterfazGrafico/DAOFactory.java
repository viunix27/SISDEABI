/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package InterfazGrafico;
import InterfazGrafico.DAO;
/**
 *
 * @author Victor
 */
public abstract class DAOFactory {
    
     // Definimos unas constantes por cada base de datos
    public static final int MYSQL = 1;
    
 
    // Existirá un método get por cada DAO que exista en el sistema
    public abstract DAO getHistoricoDenunciaDAO();
 
    public static DAOFactory getDAOFactory(int whichFactory) {
        switch (whichFactory) {
            case MYSQL:
                return new MySqlDAOFactory ();            
            default:
                return null;
                 }
    }
}
