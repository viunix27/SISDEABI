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
public class HistoricoDenuncia {
    
    String fecha;
    int Denuncias;
    String Departamento;

    public HistoricoDenuncia(String fecha, int Denuncias, String Departamento) {
        this.fecha = fecha;
        this.Denuncias = Denuncias;
        this.Departamento = Departamento;
    }

    public HistoricoDenuncia() {
        
    }
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getDenuncias() {
        return Denuncias;
    }

    public void setDenuncias(int Denuncias) {
        this.Denuncias = Denuncias;
    }
    
    public String getDepartamento() {
        return Departamento;
    }

    public void setDepartamento(String Departamento) {
        this.Departamento = Departamento;
    }

   public String toString() {
        return "Producto{" + "fecha=" + fecha + ", Denuncias=" + Denuncias + ", Departamento=" + Departamento + '}';
    }
    
}
