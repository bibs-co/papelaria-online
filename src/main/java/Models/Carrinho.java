/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author henri
 */
public class Carrinho {
    private int id;
    private int usuarioId;
    private List<ItemCarrinho> listaDeItens;
    private double total;
    
    public Carrinho(int id, int usuarioId) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.listaDeItens = new ArrayList<>();
        this.total = 0.0;
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

    public List<ItemCarrinho> getListaDeItens() {
        return listaDeItens;
    }

    public void setListaDeItens(List<ItemCarrinho> listaDeItens) {
        this.listaDeItens = listaDeItens;
        calcularTotal(); 
    }

    public double getTotal() {
        return total;
    }

    public void adicionarItem(ItemCarrinho item) {
        listaDeItens.add(item);
        calcularTotal();
    }

    public void removerItem(ItemCarrinho item) {
        listaDeItens.remove(item);
        calcularTotal();
    }

    private void calcularTotal() {
        total = 0.0;
        for (ItemCarrinho item : listaDeItens) {
            total += item.getSubtotal();
        }
    }

    @Override
    public String toString() {
        return "Carrinho{" +
                "id=" + id +
                ", usuarioId=" + usuarioId +
                ", listaDeItens=" + listaDeItens +
                ", total=" + total +
                '}';
    }
}

