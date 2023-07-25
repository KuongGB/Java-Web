package dto;
public class User {
    private String uid;
    private String fullname;
    private String pass;
    private String role;
    private boolean vip;

    public User() {
    }

    public User(String uid, String fullname, String pass, String role, boolean vip) {
        this.uid = uid;
        this.fullname = fullname;
        this.pass = pass;
        this.role = role;
        this.vip = vip;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isVip() {
        return vip;
    }

    public void setVip(boolean vip) {
        this.vip = vip;
    }

    
    
}
