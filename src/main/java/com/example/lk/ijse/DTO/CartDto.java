package com.example.lk.ijse.DTO;

import com.example.lk.ijse.Entity.users;
import com.example.lk.ijse.Entity.products;

import java.util.ArrayList;
import java.util.List;

public class CartDto {

    private int  cart_id;
    private List<users> registrationslist = new ArrayList<>();
    private List<products> Productlist = new ArrayList<>();

    private int quantity;

}
