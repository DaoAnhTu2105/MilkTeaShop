/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sample;

import DTO.ProductDTO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author TBL
 */
public class Cart {
    private Map<String, ProductDTO> cart;

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    public Cart(){
        
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    public boolean add(ProductDTO pro){
        boolean check = false;
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(pro.getProductID())){
            int currentQuantity = this.cart.get(pro.getProductID()).getQuantity();
            pro.setQuantity(currentQuantity + pro.getQuantity());
        }
        this.cart.put(pro.getProductID(), pro);
        check = true;
        return check;
    }
    public boolean remove(String id){
        boolean check = false;
        if(this.cart != null ){
            if(this.cart.containsKey(id)){
                  this.cart.remove(id);
                  check = true;
            }
           
        }
        return check;
    }
    public boolean update(String id, ProductDTO pro){
        boolean check = false;
        if(this.cart != null){
            if(this.cart.containsKey(id)){
                this.cart.replace(id, pro);
                check = true;
            }
        }
        return check;
    }
}
