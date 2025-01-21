package com.example.lk.ijse.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class categories {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int category_id;

    private String Category_name;

    private String desc;



}
