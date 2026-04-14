/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Aprendiz
 */
public class Horarios {
    private int id_horarios;
    private date fecha;
    private time hora_inicial;
    private time hora_final;
    
    public int getid_Horarios (){
        return id_horarios;
    }
    public void setid_Horarios (int id_horarios){
        this.id_horarios = id_horarios;
    }
    public date getFecha (){
        return fecha;
    }
    public void setFecha (date fecha){
        this.fecha = fecha;
    }
    public time getHora_inicial (){
        return hora_inicial;
    }
    public void setHora_inicial (time hora_inicial){
        this.hora_inicial = hora_inicial;
    }
    public time getHora_final (){
        return hora_final;
    }
    public void setHora_final (time hora_final){
        this.hora_final = hora_final;
    }

    private static class date {

        public date() {
        }
    }

    private static class time {

        public time() {
        }
    }
}
