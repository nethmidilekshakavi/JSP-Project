package com.example.lk.ijse.Bo;


import com.example.lk.ijse.Bo.impl.CartBoImpl;
import com.example.lk.ijse.Bo.impl.CategoryBoImpl;
import com.example.lk.ijse.Bo.impl.ProductBoImpl;
import com.example.lk.ijse.Bo.impl.userBoImpl;

public class BOFactory {
    private static BOFactory boFactory;
    private BOFactory(){
    }
    public static BOFactory getBoFactory(){
        return (boFactory==null)? boFactory=new BOFactory() : boFactory;
    }

    public enum BOTypes{
       ADMIN,CATEGORY,PRODUCT,CART
    }

    //Object creation logic for BO objects
    public SuperBo getBO(BOTypes types){
        switch (types) {

            case ADMIN: {
                return new userBoImpl();
            }
            case CATEGORY:
                return new CategoryBoImpl();
            case PRODUCT:
                return new ProductBoImpl();
            case CART:
                return new CartBoImpl();

        }
        return null;
    }
}
