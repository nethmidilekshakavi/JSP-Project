package com.example.lk.ijse.Dao;

import com.example.lk.ijse.Dao.impl.userDaoImpl;

public class DaoFactory {
    private static DaoFactory daoFactory;

    private DaoFactory() {
    }

    public static DaoFactory getDaoFactory() {
        return (daoFactory == null) ? daoFactory = new DaoFactory() : daoFactory;
    }

    public enum DAOTypes {
        ADMIN
    }

    public SuperDao getDAO(DAOTypes types) {
        switch (types) {
            case ADMIN:
                return new userDaoImpl();
            default:
                return null;
        }
    }

}
