package com.example.lk.ijse.DTO;

import com.example.lk.ijse.Entity.categories;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProdcutDto {
    private int productid;
    private String productname;
    private String description;
    private double price;
    private int stock_qty;

    private List<categories> registrations = new ArrayList<>();

    private String img;

    private Timestamp time;
}
