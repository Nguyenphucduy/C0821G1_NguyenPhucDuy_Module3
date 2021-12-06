package furama_resort.bean;

public class Customer extends Person{
    private String customerCode;
    private String address;
    private int customerType;


    public Customer() {
    }

    public Customer(String fullName, String dateOfBirth, String gender, String identityCardNumber, String phoneNumber, String email, String address, int customerType) {
        super(fullName, dateOfBirth, gender, identityCardNumber, phoneNumber, email);
        this.address = address;
        this.customerType = customerType;
    }

    public Customer(String customerCode, String address, int customerType) {
        this.customerCode = customerCode;
        this.address = address;
        this.customerType = customerType;
    }

    public Customer(String fullName, String dateOfBirth, String gender, String identityCardNumber, String phoneNumber, String email, String customerCode, String address, int customerType) {
        super(fullName, dateOfBirth, gender, identityCardNumber, phoneNumber, email);
        this.customerCode = customerCode;
        this.address = address;
        this.customerType = customerType;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCustomerType() {
        return customerType;
    }

    public void setCustomerType(int customerType) {
        this.customerType = customerType;
    }
}
