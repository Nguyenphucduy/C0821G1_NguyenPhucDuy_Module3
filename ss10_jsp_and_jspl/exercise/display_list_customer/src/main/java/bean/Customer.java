package bean;

public class Customer {
    private String name;
    private String dateOfBirth;
    private String address;
    private int gender;
    private double rank;
    private String picture;

    public Customer(String name, String dateOfBirth, String address, int gender, double rank, String picture) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.gender = gender;
        this.rank = rank;
        this.picture = picture;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public double getRank() {
        return rank;
    }

    public void setRank(double rank) {
        this.rank = rank;
    }
}
