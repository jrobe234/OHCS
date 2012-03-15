package com.myapp.hibernate;

import java.util.Date;
import java.util.List;
import org.hibernate.cfg.Configuration;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;

/***
 * This file provides following functions:
 *  1, connect with the USER table
 *  2, select
 *  3, insert
 *  4, update
 *  5, validate login information
 * @author Ben <arkilis@gmail.com>
 */

public class UserOperate {

    private static Configuration configuration;
    private static SessionFactory sessionFactory;

    static {
        // Create the initial SessionFactory from the default configuration
        // files
        try {

            // Replace with Configuration() if you don't use annotations or JDK
            // 5.0
            configuration = new Configuration().configure("/com/myapp/hibernate/hibernate.cfg.xml");

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

        // 实例化一个新的News对象，并填充内容
        User user = new User();
//        user.setTitle("测试标题");
//        user.setContent("添加测试内容");
//        user.setDate(new Date());
        UserOperate t = new UserOperate();
        // 调用UserOper类下的存储方法,相当于执行INSERT语句

//        user.setAddress("milk road");
//        user.setDob(new Date());
//        user.setEmail("new@gmail.com");
//        user.setFname("Ben");
//        user.setGender("Boy");
//        user.setLname("Arkilis");
//        user.setLocation("xxx");
//        user.setPassword("okok");
//        user.setPhone(123456);
//        user.setUserid(2);
//
//        t.Save(user);
        // 调用查询方法,显示数据库的内容
        
        // 调用更新方法
        // t.update();
        // 调用删除
        // t.delete();
        
        user= t.getUserFromId(1);
        System.out.println(user.getFname());
    }

    /**
     * Insert an user object into db
     * @param news news对象，这个对象将被添加到库中
     */
    public void Save(User user) {
        try {

            //获取hibernate的session
            Session session = UserOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            //这里只需要调用save方法把 user对象传进去就插入成功了！
            session.save(user);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    
    public void InsertDoctor(String fname, String lname, String email, String password,
            String gender, Date date, int phone, String address, String location, float latitude,
            float longitude, String longDescription){
        
        User user= new User();
        UserOperate ut = new UserOperate();
        
        user.setFname(fname);
        user.setLname(lname);
        user.setEmail(email);
        user.setPassword(password);
        user.setGender(gender);
        user.setDob(date);
        user.setPhone(phone);
        user.setAddress(address);
        user.setLocation(location);
        user.setLatitude(latitude);
        user.setLongitude(longitude);
        user.setLongDescription(longDescription);
        
        ut.Save(user);
        
    }
    
    
    /**
     * 判断登陆信息
     * true: 账户信息合法
     * false: 不合法
     */
    public boolean isvalidate(String email, String password) {

        try {

            Session session = UserOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();

            String sql = " from User";
            List<User> l = session.createQuery(sql).list();

            for (User n : l) {
                
                if(n.getEmail().equals(email) && n.getPassword().equals(password))
                    return true;
                    
            }

            session.getTransaction().commit();
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

    /**
     *  Get specific User object by using the userid
     *  
     */
    public User getUserFromId(int userid) {
        
        User u= new User();
        
        try {
            Session session = UserOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            //带条件的查询, 这里的 User 不是表名, 而是对象名所以要注意大小写 
            String sql = " from User where userid="+ String.valueOf(userid);
            //
            //用session.createQuery（）执行HQL查询语句
            u = (User) session.createQuery(sql).uniqueResult();
            
            //System.out.println("风林火山"+u.getEmail());
            session.getTransaction().commit();
            
            return u;
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }

    /**
     * 更新方法
     */
    public void update() {
        try {
            Session session = UserOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            //定义了要装载对象的ID
            Integer id = 1;
            //用load方法装载一个对象进来
            User n = (User) session.load(User.class, new Integer(id));
            //重新设置这个对象的标题
            n.setAddress("更新后标题");
            //用update方法更新这个对象
            session.update(n);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    
    /**
     *  delete a record from user table
     */
    public void delete() {
        try {
            Session session = UserOperate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            //定义了要装载对象的ID
            Integer id = 6;
            //用load方法装载一个对象进来
            User n = (User) session.load(User.class, new Integer(id));
            //用delete方法删除这个对象
            session.delete(n);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
