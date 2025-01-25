package com.example.lk.ijse.Bo.custom;

import com.example.lk.ijse.Bo.SuperBo;
import com.example.lk.ijse.Entity.Cart;
import com.example.lk.ijse.Entity.users;

import java.io.IOException;
import java.sql.SQLException;

public interface CartBo extends SuperBo {
    boolean saveCart(Cart entity) throws IOException;

    users serachbyIDS(int uid) throws SQLException, ClassNotFoundException;
}
