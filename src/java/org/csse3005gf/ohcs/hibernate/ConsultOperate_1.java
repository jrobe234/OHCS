/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.hibernate;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.cfg.Configuration;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class ConsultOperate_1 {

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

        /*
        SimpleDateFormat df = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
        System.out.println(df.format(getCurrentDateTime()));
         * 
         */
        
        Consultation c =new Consultation();
        ConsultOperate co = new ConsultOperate();
        
        /*
        c.setPatientid(2);
        c.setDoctorid(1);
        c.setStartDateTime(new Date());
        c.setEndDateTime(new Date());
        c.setContent("Nice to talk with you! you too!");
        
        co.Save(c);*/
        
        
        //co.updateEndConsultation(co.InsertStartConsultation(1, 2), "testing");
        //System.out.println(co.InsertStartConsultation(1, 2));
        
        for(Consultation x: co.getArrayCognsult(3)){
            System.out.println("xxx:" + x.getContent());
        }
    }

    /**
     * Click the 'consultation now' button directly insert a record into db.Consultation
     * 
     * @param startDateTime
     * @param doctorid
     * @param patientid 
     */
    public int InsertStartConsultation(int doctorid, int patientid) {

        Consultation c = new Consultation();
        ConsultOperate co = new ConsultOperate();

        c.setDoctorid(doctorid);
        c.setPatientid(patientid);
        c.setStartDateTime(getCurrentDateTime());

        co.Save(c);

        // get the consultation id
        return c.getConsultationid();
        
    }

    /**
     *  click the end consultation button to end current consultation
     * @param consultationid
     * @param content 
     */
    public void updateEndConsultation(int consultationid, String content) {
        try {
            Session session = UserOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            
            //用load方法装载一个对象进来
            Consultation c = (Consultation) session.load(Consultation.class, consultationid);

            c.setEndDateTime(getCurrentDateTime());
            c.setContent(content);
            
            
            //用update方法更新这个对象
            session.update(c);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    /**
     * Save and store in the db.consultation
     * @param c 
     */
    public void Save(Consultation c) {
        try {

            //获取hibernate的session
            Session session = UserOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            //这里只需要调用save方法把 user对象传进去就插入成功了！
            session.save(c);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 
     * @return Date object
     */
    public static Date getCurrentDateTime() {

        // set the date format
        //SimpleDateFormat df = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
        return new Date();
    }
    
    
    public ArrayList<Consultation> getArrayCognsult(int patientid){
        
        ArrayList<Consultation> arr_Con= new  ArrayList<Consultation>();
        
          try {

            Session session = ConsultOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();

            String sql = " from Consultation";
            List<Consultation> c = session.createQuery(sql).list();

            for (Consultation n : c) {
                if (n.getPatientid()==patientid) {
                    arr_Con.add(n);
                }
            }
            session.getTransaction().commit();
            return arr_Con;
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
        
        
    }
    
    
      public float getExpense(int consultationid) {
    
        float expense;
        ConsultOperate co = new ConsultOperate();
        //InvoiceOperate ino = new InvoiceOperate();

        int duration = co.getDuration(consultationid);
        if (duration < 5) {
            expense = 10 + duration * 1;
        } else {
            expense = (float) (15 + (duration - 5) * 0.5);
        }
        //inv.setExpense(expense);

        //ino.Save(inv);

        return expense;
    }
      
      public int getDuration(int consultationid) {


        ConsultOperate co = new ConsultOperate();
        Consultation c = co.getConsulationFromId(consultationid);

        int duration = (int) (c.getEndDateTime().getTime() - c.getStartDateTime().getTime()) / 60000;

        return duration;
    }
      
       public Consultation  getConsulationFromId(int consultationid){
    
        Consultation c= new Consultation();
        
        try {
            Session session = ConsultOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            // User is the class name not the db table
            String sql = " from Consultation where consultationid=" + String.valueOf(consultationid);
            //
            // using session.createQuery（） HQL
            c = (Consultation) session.createQuery(sql).uniqueResult();

            session.getTransaction().commit();

            return c;
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return c;
        
    }
    
}
