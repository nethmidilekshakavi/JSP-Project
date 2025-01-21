package com.example.lk.ijse.Bo;


import com.example.lk.ijse.Bo.impl.userBoImpl;

public class BOFactory {
    private static BOFactory boFactory;
    private BOFactory(){
    }
    public static BOFactory getBoFactory(){
        return (boFactory==null)? boFactory=new BOFactory() : boFactory;
    }

    public enum BOTypes{
       ADMIN
    }

    //Object creation logic for BO objects
    public userBoImpl getBO(BOTypes types){
        switch (types) {

            case ADMIN: {
                return new userBoImpl();
            }

        }
        return null;
    }
}
