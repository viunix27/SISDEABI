/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package InterfazGrafico;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Victor
 */
public class MySqlDAO implements DAO {
    
    public MySqlDAO() {
        
    }
    
        public List<HistoricoDenuncia> listarHistoricoDenuncia() {
        List<HistoricoDenuncia> listarHistorico = new ArrayList<HistoricoDenuncia>();
        List<HistoricoMes> listarMes = new ArrayList<HistoricoMes>();
        
        try {
            String query = "Select date(fecha) fecha, sum(Denuncias)Denuncias, departamento from denuncias.history_example where date_format(fecha,'%y%m%d') between '230208' and '230214' group by fecha,departamento;";
                            //Select date(fecha) fecha, sum(Denuncias)Denuncias,departamento from denuncias.history_example where date_format(fecha,'%y%m%d') >= date_format(CURDATE()-7,'%y%m%d')group by fecha,departamento;        
            Connection cn = MySQLConexion.obtenerConexion();
            PreparedStatement ps = cn.prepareCall(query);
           
            ResultSet rs = ps.executeQuery();
            HistoricoDenuncia h;
            while (rs.next()) {
                h = new HistoricoDenuncia(rs.getString(1),rs.getInt(2),rs.getString(3));
                listarHistorico.add(h);
            }
        } catch (SQLException e) {
            System.out.println("[MySqlProductoDAO] Error al intentrar listar la información: " + e);
        }
        return listarHistorico;
    }

    @Override
    public List<HistoricoDepartamento> listarHistoricoDepartamento() {
        List<HistoricoDepartamento> listarDepartamento = new ArrayList<HistoricoDepartamento>();
         try {
            String query = "select departamento, sum(Denuncias)Denuncias from denuncias.history_example group by departamento limit 7;";      
            Connection cn = MySQLConexion.obtenerConexion();
            PreparedStatement ps = cn.prepareCall(query);
           
            ResultSet rs = ps.executeQuery();
            HistoricoDepartamento h2;
            while (rs.next()) {
                h2 = new HistoricoDepartamento(rs.getString(1),rs.getInt(2));
                listarDepartamento.add(h2);
            }
        } catch (SQLException e) {
            System.out.println("[MySqlProductoDAO] Error al intentrar listar la información: " + e);
        }
       
        return listarDepartamento;
    }

    @Override
    public List<HistoricoMes> listarHistoricoMes() {
        List<HistoricoMes> listarHistoricoMes = new ArrayList<HistoricoMes>();
         try {
            String query = "Select  CONCAT(year(fecha), '/',month(fecha)) Periodo, sum(Denuncias)Denuncias from denuncias.history_example where date_format(fecha,'%y%m%d') between '220801' and '230214'group by CONCAT(year(fecha), '/',month(fecha));";      
            Connection cn = MySQLConexion.obtenerConexion();
            PreparedStatement ps = cn.prepareCall(query);
           
            ResultSet rs = ps.executeQuery();
            HistoricoMes h3;
            while (rs.next()) {
                h3 = new HistoricoMes(rs.getString(1),rs.getInt(2));
                listarHistoricoMes.add(h3);
            }
        } catch (SQLException e) {
            System.out.println("[MySqlProductoDAO] Error al intentrar listar la información: " + e);
        }
       
        return listarHistoricoMes;
    }
 
}
