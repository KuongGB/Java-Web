package dao;

import dto.Book;
import dto.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.DBUtils;

public class BookDao {
    public static ArrayList<Book> getBookList(){
        ArrayList<Book> bList = new ArrayList<>();
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            String sql = "SELECT books.id, books.name, books.author, categories.name as cate, img, description, vip FROM books, categories WHERE books.cid = categories.cid";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String author = rs.getString("author");
                String category = rs.getString("cate");
                String img = rs.getString("img");
                String des = rs.getString("description");
                boolean vip = rs.getBoolean("vip");
                bList.add(new Book(id, name, author, category, img, des, vip));
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
        return bList;
    }
    
    public static Book getBookByID(int id){
        Book b = null;
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            String sql = "SELECT books.name, books.author, categories.name as cate, img, description, vip FROM books, categories WHERE books.cid = categories.cid and books.id = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs != null && rs.next()){
                String name = rs.getString("name");
                String author = rs.getString("author");
                String category = rs.getString("cate");
                String img = rs.getString("img");
                String des = rs.getString("description");
                boolean vip = rs.getBoolean("vip");
                b = new Book(id, name, author, category, img, des, vip);
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
        return b;
    }
    
    public static boolean insertBook(String name, String author, int cate, String img, String des, boolean vip){
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "INSERT INTO books(name,author,cid,img,description,vip) values (?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, author);
                pst.setInt(3, cate);
                pst.setString(4, img);
                pst.setString(5, des);
                pst.setBoolean(6, vip);
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
    
    public static boolean updateBook(int id, String name, String author, int cate, String img, String des, boolean vip){
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "UPDATE books SET name = ?, author = ?, cid =?, img = ?, description = ?, vip = ? WHERE id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, author);
                pst.setInt(3, cate);
                pst.setString(4, img);
                pst.setString(5, des);
                pst.setBoolean(6, vip);
                pst.setInt(7, id);
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
    
    public static boolean deleteBook(int id){
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "DELETE FROM books WHERE id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
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
    
    public static ArrayList<Category> getCateList(){
        ArrayList<Category> cList = new ArrayList<>();
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            String sql = "SELECT * FROM categories";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                int id = rs.getInt("cid");
                String name = rs.getString("name");
                cList.add(new Category(id, name));
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
        return cList;
    }
    
    public static void insertBookShelf(String uid, int bid){
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "INSERT INTO bookshelf(uid,bid,isFinish) values (?,?,0)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, uid);
                pst.setInt(2, bid);
                pst.executeUpdate();
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
    }
    
    public static boolean getStatusInBookShelf(int bid, String uid){
        Connection cn = null;
        boolean isFinish = false;
        try{
            cn = DBUtils.makeConnection();
            String sql = "SELECT isFinish FROM bookshelf WHERE uid = ? and bid = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, uid);
            pst.setInt(2, bid);
            ResultSet rs = pst.executeQuery();
            if(rs != null && rs.next()){
                isFinish = rs.getBoolean("isFinish");
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
        return isFinish;
    }
    
    public static void updateStatusInBookShelf(int bid, String uid){
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            String sql = "UPDATE bookshelf SET isFinish = 1 WHERE uid = ? and bid = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, uid);
            pst.setInt(2, bid);
            pst.executeQuery();
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
    }
    
    public static ArrayList<Integer> getUserBookShelf(String uid){
        Connection cn = null;
        ArrayList<Integer> bidList = new ArrayList<>();
        try{
            cn = DBUtils.makeConnection();
            String sql = "SELECT bid FROM bookshelf WHERE uid = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, uid);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                int id = rs.getInt("bid"); 
                bidList.add(id);
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
        return bidList;
    }
    
    public static ArrayList<Book> searchBook(String key, String type){
        Connection cn = null;
        ArrayList<Book> bList = new ArrayList<>();
        try{
            cn = DBUtils.makeConnection();
            String sql = "SELECT books.id, books.name, books.author, categories.name as cate, img, description, vip FROM books, categories WHERE books.cid = categories.cid AND ";
            sql += type;
            sql += " like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+ key+ "%");
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String author = rs.getString("author");
                String category = rs.getString("cate");
                String img = rs.getString("img");
                String des = rs.getString("description");
                boolean vip = rs.getBoolean("vip");
                bList.add(new Book(id, name, author, category, img, des, vip));
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
        return bList;
    }
}
