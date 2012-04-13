package org.csse3005gf.ohcs.hibernate;

import java.util.Date;
import org.hibernate.cfg.Configuration;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class PrescriptOperate {

    private static Configuration configuration;
    private static SessionFactory sessionFactory;

    static {
        // Create the initial SessionFactory from the default configuration
        // files
        try {

            // Replace with Configuration() if you don't use annotations or JDK
            // 5.0
            configuration = new Configuration().configure("/org/csse3005gf/ohcs/hibernate/hibernate.cfg.xml");

            // or use static variable handling
            sessionFactory = configuration.buildSessionFactory();


        } catch (Throwable ex) {
            // We have to catch Throwable, otherwise we will miss
            // NoClassDefFoundError and other subclasses of Error
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void main(String[] args) {

        PrescriptOperate po= new PrescriptOperate();
        po.insertPrescript(1,3,"influenza","take pills");
    }

    public void insertPrescript(int doctorid, int patientid, String title, String content) {

        Prescript prescript = new Prescript();
        PrescriptOperate po= new PrescriptOperate();
        prescript.setDoctorid(doctorid);
        prescript.setPatientid(patientid);
        prescript.setTitle(title);
        prescript.setContent(content);
        prescript.setDate(getCurrentDateTime());
        
        po.Save(prescript);


    }

    public void Save(Prescript prescript) {
        try {

            //获取hibernate的session
            Session session = PrescriptOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            //这里只需要调用save方法把 user对象传进去就插入成功了！
            session.save(prescript);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static Date getCurrentDateTime() {

        // set the date format
        //SimpleDateFormat df = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
        return new Date();
    }
}
