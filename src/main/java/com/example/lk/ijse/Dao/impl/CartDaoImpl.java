package com.example.lk.ijse.Dao.impl;

import com.example.lk.ijse.Dao.custom.CartDao;
import com.example.lk.ijse.Entity.Cart;
import com.example.lk.ijse.config.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;

public class CartDaoImpl implements CartDao {

    @Override
    public boolean save(Cart cart) throws IOException {

        Transaction transaction = null;
        try (Session session = FactoryConfiguration.getInstance().getSession()) {
            transaction = session.beginTransaction();

            session.save(cart);

            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }



}
