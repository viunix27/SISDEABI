/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package InterfazGrafico;

import java.util.List;
import InterfazGrafico.HistoricoDenuncia;
/**
 *
 * @author Victor
 */
public interface DAO {
    
     public List<HistoricoDenuncia> listarHistoricoDenuncia(); 
     public List<HistoricoDepartamento> listarHistoricoDepartamento();  
     public List<HistoricoMes> listarHistoricoMes();  
}
