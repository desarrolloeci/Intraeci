/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dto;

/**
 *
 * @author andres.rojas
 */
public class conciliacion {
    
    private String empID;
    private String fechaTransaccion;
    private String fuentePago;
    private String valorPago;
    private String cedula;

    public String getEmpID() {
        return empID;
    }

    public void setEmpID(String empID) {
        this.empID = empID;
    }

    public String getFechaTransaccion() {
        return fechaTransaccion;
    }

    public void setFechaTransaccion(String fechaTransaccion) {
        this.fechaTransaccion = fechaTransaccion;
    }

    public String getFuentePago() {
        return fuentePago;
    }

    public void setFuentePago(String fuentePago) {
        this.fuentePago = fuentePago;
    }

    public String getValorPago() {
        return valorPago;
    }

    public void setValorPago(String valorPago) {
        this.valorPago = valorPago;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public conciliacion() {
    }

    public conciliacion(String empID, String fechaTransaccion, String valorPago) {
        this.empID = empID;
        this.fechaTransaccion = fechaTransaccion;
        this.valorPago = valorPago;
    }

    public conciliacion(String empID, String fechaTransaccion, String fuentePago, String valorPago) {
        this.empID = empID;
        this.fechaTransaccion = fechaTransaccion;
        this.fuentePago = fuentePago;
        this.valorPago = valorPago;
    }

    public conciliacion(String empID, String fechaTransaccion, String fuentePago, String valorPago, String cedula) {
        this.empID = empID;
        this.fechaTransaccion = fechaTransaccion;
        this.fuentePago = fuentePago;
        this.valorPago = valorPago;
        this.cedula = cedula;
    }
    
    
}
