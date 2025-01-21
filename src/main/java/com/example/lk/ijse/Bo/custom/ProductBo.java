package com.example.lk.ijse.Bo.custom;

import com.example.lk.ijse.Bo.SuperBo;
import com.example.lk.ijse.Entity.products;

import java.io.IOException;

public interface ProductBo extends SuperBo {
    boolean saveProducts(products entity) throws IOException;
}
