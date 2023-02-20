/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sql;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 *
 * @author Victor
 */
public class Conexion {  
        protected Connection conn = null;    
        protected Statement st = null;
        protected ResultSet rs = null;
        
        public Connection getConnection()
        {
        return conn;
        }
        public Statement st()
        {
            return st;
        }
        
        public Conexion()
        {
        }
        
        public Connection Conectar()
        {
            conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/denuncias?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "1234");         
            st = conn.createStatement();
        }
        catch (Exception e) 
        {
        System.err.println("Error" + e.getMessage());  
        }
        return conn;
        }
        
         
        
    
}
