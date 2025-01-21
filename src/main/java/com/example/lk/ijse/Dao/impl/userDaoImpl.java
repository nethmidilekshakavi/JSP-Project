package com.example.lk.ijse.Dao.impl;
import com.example.lk.ijse.Dao.custom.UserDao;
import com.example.lk.ijse.Entity.users;
import com.example.lk.ijse.config.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.io.IOException;

public class userDaoImpl implements UserDao {

    @Override
    public boolean save(users users) throws IOException {

        Transaction transaction = null;
        try (Session session = FactoryConfiguration.getInstance().getSession()) {
            transaction = session.beginTransaction();

            session.save(users);

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
