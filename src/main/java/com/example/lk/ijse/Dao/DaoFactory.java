package com.example.lk.ijse.Dao;
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
                return new AdminDaoImpl();
            default:
                return null;
        }
    }

}
