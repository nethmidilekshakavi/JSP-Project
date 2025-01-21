package com.example.lk.ijse.Dao.impl;

import com.example.lk.ijse.Dao.custom.ProductDao;
import com.example.lk.ijse.Entity.products;
import com.example.lk.ijse.config.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;

public class ProductDaoImpl implements ProductDao {

    @Override
    public boolean save(products p) throws IOException {

        Transaction transaction = null;
        try (Session session = FactoryConfiguration.getInstance().getSession()) {
            transaction = session.beginTransaction();

            session.save(p);

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
