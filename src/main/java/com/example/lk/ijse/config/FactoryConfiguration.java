package com.example.lk.ijse.config;


import com.example.lk.ijse.Entity.categories;
import com.example.lk.ijse.Entity.products;
import com.example.lk.ijse.Entity.users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.util.Properties;

public class FactoryConfiguration {
    private static FactoryConfiguration factoryConfiguration;
    private final SessionFactory sessionFactory;

    private FactoryConfiguration() throws IOException {
        try {
            Configuration configuration = new Configuration();
            Properties properties = new Properties();

            properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("hibernate.properties"));
            configuration.setProperties(properties);

            configuration.addAnnotatedClass(users.class);
            configuration.addAnnotatedClass(categories.class);
            configuration.addAnnotatedClass(products.class);


            sessionFactory = configuration.buildSessionFactory();
        } catch (IOException e) {
            throw new IOException("Failed to load hibernate.properties", e);
        } catch (Exception e) {
            throw new RuntimeException("Failed to create SessionFactory", e);
        }
    }

    public static FactoryConfiguration getInstance() throws IOException {
        if (factoryConfiguration == null) {
            factoryConfiguration = new FactoryConfiguration();
        }
        return factoryConfiguration;
    }


    public Session getSession() {
        return sessionFactory.openSession();
    }

    public static SessionFactory getSessionFactory() {
        return factoryConfiguration.sessionFactory;
    }
}
