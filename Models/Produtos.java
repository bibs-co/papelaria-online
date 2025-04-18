/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author henri
 */
public class Produtos {
    private int id;
    private String produto;
    private float valor;
    private String descricao;
    private String imagem;

    public Produtos(int id, String produto, float valor, String descricao, String imagem) {
        this.id = id;
        this.produto = produto;
        this.valor = valor;
        this.descricao = descricao;
        this.imagem = imagem;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }
    
    @Override
    public String toString() {
        return "Produto{" +
                "id=" + id +
                ", nome='" + produto + '\'' +
                ", preco=" + valor +
                ", descricao='" + descricao + '\'' +
                ", imagem='" + imagem + '\'' +
                '}';
    }
}

