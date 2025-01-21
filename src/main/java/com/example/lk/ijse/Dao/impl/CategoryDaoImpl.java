package com.example.lk.ijse.Dao.impl;

import com.example.lk.ijse.Dao.custom.CategoryDao;
import com.example.lk.ijse.Entity.categories;
import com.example.lk.ijse.config.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public boolean save(categories categories) throws IOException {

        Transaction transaction = null;
        try (Session session = FactoryConfiguration.getInstance().getSession()) {
            transaction = session.beginTransaction();

            session.save(categories);

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


    @Override
    public boolean update(categories categories) throws IOException {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = session.beginTransaction();

        session.update(categories);


        transaction.commit();
        session.close();


        return false;
    }

    @Override
    public boolean delete(int entityId) throws IOException {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = null;
        try {
            session.beginTransaction();
            categories categories = session.get(categories.class,entityId);
            session.delete(categories);
            session.getTransaction().commit();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return false;
    }

}
