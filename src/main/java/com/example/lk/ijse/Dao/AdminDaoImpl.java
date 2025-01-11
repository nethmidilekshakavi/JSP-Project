package com.example.lk.ijse.Dao;
import com.example.lk.ijse.DTO.AdminDto;
import com.example.lk.ijse.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;

public class AdminDaoImpl implements AdminDao{

    @Override
    public boolean save(AdminDto admin) throws IOException {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = session.beginTransaction();

        session.save(admin);

        transaction.commit();
        session.close();


        return false;
    }
}
