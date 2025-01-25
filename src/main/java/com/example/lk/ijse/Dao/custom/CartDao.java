package com.example.lk.ijse.Dao.custom;

import com.example.lk.ijse.CrudDao;
import com.example.lk.ijse.Entity.Cart;
import com.example.lk.ijse.Entity.categories;

import java.io.IOException;

public interface CartDao extends CrudDao<Cart> {
    boolean save(Cart cart) throws IOException;
}
