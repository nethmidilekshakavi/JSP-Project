package com.example.lk.ijse.DTO;

import com.example.lk.ijse.Entity.Admin;
import com.example.lk.ijse.Entity.Products;

import java.util.ArrayList;
import java.util.List;

public class CartDto {

    private int  cart_id;
    private List<Admin> registrationslist = new ArrayList<>();
    private List<Products> Productlist = new ArrayList<>();

    private int quantity;

}
