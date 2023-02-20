/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package InterfazGrafico;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author Victor
 */
public class Service {
      // Referenciamos la fábrica específica de daos y le indicamos nuestro origen de datos (MSSQL)
    DAOFactory fabrica = DAOFactory.getDAOFactory(Constantes.ORIGENDATOS);
 
    // Le pedimos a la fábrica específica el o los daos que necesitemos
    DAO objHistoricoDAO = fabrica.getHistoricoDenunciaDAO();
    
    public List<HistoricoDenuncia> listarHistoricoDenuncia() {
        return objHistoricoDAO.listarHistoricoDenuncia();
    }
    
    public List<HistoricoDepartamento> listarHistoricoDepartamento() {
        return objHistoricoDAO.listarHistoricoDepartamento();
    }
    public List<HistoricoMes> listarHistoricoMes() {
        return objHistoricoDAO.listarHistoricoMes();
    }
}
