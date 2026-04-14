/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Aprendiz
 */
public class Paciente {
     private int id_paciente;
    private date fecha_nacimiento;
    private String diagnostico;
    
    public int getid_Paciente (){
        return id_paciente;
    }
    public void setid_Paciente (int id_paciente){
        this.id_paciente = id_paciente;
    }
    public date getFecha_nacimiento (){
        return fecha_nacimiento;
    }
    public void setFecha_nacimiento (date fecha_nacimiento){
        this.fecha_nacimiento = fecha_nacimiento;
    }
    public String getDiagnostico (){
        return diagnostico;
    }
    public void setDiagnostico (String diagnostico){
        this.diagnostico = diagnostico;
    }

    private static class date {

        public date() {
        }
    }
}
