package com.example.lk.ijse.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Products {
    private int productid;
    private String productname;
    private String description;
    private double price;
    private int stock_qty;

    private List<Category> registrations = new ArrayList<>();

    private String img;

    private Timestamp time;
}



