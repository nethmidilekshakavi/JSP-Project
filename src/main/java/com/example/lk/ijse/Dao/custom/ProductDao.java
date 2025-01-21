package com.example.lk.ijse.Dao.custom;

import com.example.lk.ijse.CrudDao;
import com.example.lk.ijse.Entity.products;

import java.io.IOException;

public interface ProductDao extends CrudDao<products> {
    boolean save(products products) throws IOException;
}
