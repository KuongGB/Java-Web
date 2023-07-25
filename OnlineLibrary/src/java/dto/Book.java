package dto;

public class Book {
    private int id;
    private String name;
    private String author;
    private String category;
    private String img;
    private String description;
    private boolean vip;

    public Book() {
    }

    public Book(int id, String name, String author, String category, String img, String description, boolean vip) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.category = category;
        this.img = img;
        this.description = description;
        this.vip = vip;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDes() {
        return description;
    }

    public void setDes(String description) {
        this.description = description;
    }

    public boolean isVip() {
        return vip;
    }

    public void setVip(boolean vip) {
        this.vip = vip;
    }

    
    
}
