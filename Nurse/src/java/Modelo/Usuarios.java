/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Aprendiz
 */
public class Usuarios {
    private int id_usuarios;
    private String nombres;
    private String apellidos;
    private String identificacion;
    private String telefono;
    private String direccion;
    private String correo;
    private String clave;
    
    public int getid_Usuarios (){
        return id_usuarios;
    }
    public void setid_Usuarios (int usuarios){
         this.id_usuarios = id_usuarios;
    }
    public String getNombres (){
        return nombres;
    }
    public void setNombres (String nombres){
        this.nombres = nombres;
    }
    public String getApellidos (){
        return apellidos;
    }
    public void setApellidos (String apellidos){
        this.apellidos = apellidos;
    }
    public String getIdentificacion (){
        return identificacion;
    }
    public void setIdentificacion (String identificacion){
        this.identificacion = identificacion;
    }
    public String getTelefono (){
        return telefono;
    }
    public void setTelefono (String telefono){
        this.telefono = telefono;
    }
    public String getDireccion (){
            return direccion;
    }
    public void setDireccion (String direccion){
            this.direccion = direccion;
    }               
    public String getCorreo (){
        return correo;
    }
    public void setCorreo (String correo){
        this.correo = correo;
    }
    public String getClave (){
        return clave;
    }
    public void setClave (String clave){
        this.clave = clave;
    }       

    public String getNombre() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Object getDocumento() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getApellido() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Object getRoles() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
