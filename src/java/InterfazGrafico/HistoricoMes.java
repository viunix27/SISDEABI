/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package InterfazGrafico;

/**
 *
 * @author Victor
 */
public class HistoricoMes {
    
    String Mes;
    int Denuncias;
   

    public HistoricoMes(String Mes, int Denuncias) {
        this.Mes = Mes;
        this.Denuncias = Denuncias;
        
    }

    public HistoricoMes() {
        
    }

   
    public String getMes() {
        return Mes;
    }

    public void setMes(String Mes) {
        this.Mes = Mes;
    }

    public int getDenuncias() {
        return Denuncias;
    }

    public void setDenuncias(int Denuncias) {
        this.Denuncias = Denuncias;
    }
      

   public String toString() {
        return "Producto{" + ", Mes=" + Mes + ", Denuncias=" + Denuncias + '}';
    }
    
}
