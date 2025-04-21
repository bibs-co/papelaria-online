/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

public class ItemCarrinho {
    private int id; 
    private int produtoId; 
    private int quantidade; 
    private double subtotal; 

    // Construtor
    public ItemCarrinho(int id, int produtoId, int quantidade, double precoUnitario) {
        this.id = id;
        this.produtoId = produtoId;
        this.quantidade = quantidade;
        this.subtotal = precoUnitario * quantidade; 
    }

    // Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(int produtoId) {
        this.produtoId = produtoId;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "ItemCarrinho{" +
                "id=" + id +
                ", produtoId=" + produtoId +
                ", quantidade=" + quantidade +
                ", subtotal=" + subtotal +
                '}';
    }
}
