/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author henri
 */

import java.time.LocalDate;

public class Pedido {
    private int id; 
    private int usuarioId; 
    private LocalDate data; 
    private String status; 
    private double valorTotal; 

    public Pedido(int id, int usuarioId, LocalDate data, String status, double valorTotal) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.data = data;
        this.status = status;
        this.valorTotal = valorTotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }
    @Override
    public String toString() {
        return "Pedido{" +
                "id=" + id +
                ", usuarioId=" + usuarioId +
                ", data=" + data +
                ", status='" + status + '\'' +
                ", valorTotal=" + valorTotal +
                '}';
    }
}

