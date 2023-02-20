/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package InterfazGrafico;

/**
 *
 * @author Victor
 */
public class MySqlDAOFactory extends DAOFactory{
    
    public MySqlDAOFactory() {
    }
 
    // Estamos aplicando la 2da forma de polimorfismo.
    // Una clase puede ser enmascarada con la interface que implementa
     
    public DAO getHistoricoDenunciaDAO() {
        return new MySqlDAO();
    }
      
}
