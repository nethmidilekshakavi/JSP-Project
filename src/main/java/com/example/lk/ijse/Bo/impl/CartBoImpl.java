package com.example.lk.ijse.Bo.impl;

import com.example.lk.ijse.Bo.custom.CartBo;
import com.example.lk.ijse.Dao.DaoFactory;
import com.example.lk.ijse.Dao.custom.CartDao;
import com.example.lk.ijse.Dao.custom.UserDao;
import com.example.lk.ijse.Entity.Cart;
import com.example.lk.ijse.Entity.users;

import java.io.IOException;
import java.sql.SQLException;

public class CartBoImpl implements CartBo {

    CartDao cartDao = (CartDao) DaoFactory.getDaoFactory().getDAO(DaoFactory.DAOTypes.CART);
    UserDao userDao = (UserDao) DaoFactory.getDaoFactory().getDAO(DaoFactory.DAOTypes.ADMIN);

    @Override
    public boolean saveCart(Cart entity) throws IOException {
        return cartDao.save(new Cart(entity.getCartId(),entity.getUser(),entity.getProductId(),entity.getQuantity(),entity.getAddedAt(),entity.getImageUrl(),entity.getPrice(),entity.getTotal(),entity.getProductSize()));
    }


    @Override
    public users serachbyIDS(int uid) throws SQLException, ClassNotFoundException {
        return userDao.searchById(uid);
    }


}
