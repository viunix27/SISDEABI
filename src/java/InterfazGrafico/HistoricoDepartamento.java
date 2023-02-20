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
public class HistoricoDepartamento {
    
    String Departamento;
    int Denuncias;
   

    public HistoricoDepartamento(String Departamento, int Denuncias) {
        this.Departamento = Departamento;
        this.Denuncias = Denuncias;
        
    }

    public HistoricoDepartamento() {
        
    }
    public String getDepartamento() {
        return Departamento;
    }

    public void setDepartamento(String Departamento) {
        this.Departamento = Departamento;
    }

    public int getDenuncias() {
        return Denuncias;
    }

    public void setDenuncias(int Denuncias) {
        this.Denuncias = Denuncias;
    }
      

   public String toString() {
        return "Producto{" + ", Departamento=" + Departamento + ", Denuncias=" + Denuncias + '}';
    }
    
}
