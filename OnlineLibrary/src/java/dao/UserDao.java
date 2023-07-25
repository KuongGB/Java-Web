package dao;

import dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBUtils;

public class UserDao {
    public static User getUser(String uid, String pass){
        User u = null;
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "SELECT uid,fullname,pass,role,vip FROM users WHERE uid = ? AND pass = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, uid);
                pst.setString(2, pass);
                ResultSet rs = pst.executeQuery();
                if(rs != null && rs.next()){
                    String id = rs.getString("uid");
                    String fname = rs.getString("fullname");
                    String password = rs.getString("pass");
                    String role = rs.getString("role").trim();
                    boolean vip = rs.getBoolean("vip");
                    u = new User(id, fname, password, role, vip);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(cn != null){
                try{
                    cn.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return u;
    }
    
    public static User getUserById(String uid){
        User u = null;
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "SELECT uid,fullname,pass,role,vip FROM users WHERE uid = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, uid);
                ResultSet rs = pst.executeQuery();
                if(rs != null && rs.next()){
                    String id = rs.getString("uid");
                    String fname = rs.getString("fullname");
                    String password = rs.getString("pass");
                    String role = rs.getString("role").trim();
                    boolean vip = rs.getBoolean("vip");
                    u = new User(id, fname, password, role, vip);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(cn != null){
                try{
                    cn.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return u;
    }
    
    public static ArrayList<User> getUserList(){
        ArrayList<User> uList = new ArrayList<>();
        Connection cn = null;
        User u = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "SELECT uid,fullname,pass,role,vip FROM users";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
                    String id = rs.getString("uid");
                    String fname = rs.getString("fullname");
                    String password = rs.getString("pass");
                    String role = rs.getString("role").trim();
                    boolean vip = rs.getBoolean("vip");
                    u = new User(id, fname, password, role, vip);
                    uList.add(u);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(cn != null){
                try{
                    cn.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return uList;
    }
    
    public static boolean updateUser(String id, String name, String pass, boolean vip){
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "UPDATE users SET fullname = ?, pass = ?, vip = ? WHERE uid = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, pass);
                pst.setString(4, id);
                pst.setBoolean(3, vip);
                pst.executeUpdate();
                if(pst.getUpdateCount() == 0) return false;
                else return true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(cn != null){
                try{
                    cn.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return false;
    }
    
    public static boolean deleteUser(String id){
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "DELETE FROM bookshelf WHERE uid = ? DELETE FROM users WHERE uid = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, id);
                pst.setString(2, id);
                pst.executeUpdate();
                if(pst.getUpdateCount() == 0) return false;
                else return true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(cn != null){
                try{
                    cn.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return false;
    }
    
    public static boolean insertUser(String id, String name, String pass){
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "INSERT INTO users(uid,fullname,pass,role,vip) values (?,?,?,'US',0)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, id);
                pst.setString(2, name);
                pst.setString(3, pass);
                pst.executeUpdate();
                if(pst.getUpdateCount() == 0) return false;
                else return true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(cn != null){
                try{
                    cn.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return false;
    }
}
