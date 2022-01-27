/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carsales;

/**
 *
 * @author USER
 */
public class User {
    
    private byte[] picture;
    
    public User(byte[] image){
        this.picture = image;
        
    }
    
    public byte[] getImage(){
        return picture;
    }
    
    
}
