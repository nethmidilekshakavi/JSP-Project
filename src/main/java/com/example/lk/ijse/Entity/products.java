package com.example.lk.ijse.Entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class products {

    @Id
    private int productid;

    private String productname;

    private String description;

    private double price;

    private int stock_qty;

    // Many-to-one relationship with categories
    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "category_id", nullable = false)
    private int category;

    private String img;

}
