package dao;

import dto.User;

public class testDao {
    public static void main(String[] args) {
        User u = UserDao.getUser("admin", "1");
        //System.out.println(u);
        //System.out.println(UserDao.getUserList());
        System.out.println(BookDao.searchBook("", "author"));
    }
}
