package furama_resort.bean;

public class Employee extends Person{
    private String employeeCode;
    private double salary;
    private String address;
    private int position;
    private int educationDegree;
    private int division;
    private String userName;

    public Employee() {

    }

    public Employee(String fullName, String dateOfBirth, String identityCardNumber, String phoneNumber, String email, String employeeCode, double salary, String address, int position, int educationDegree, int division, String userName) {
        super(fullName, dateOfBirth, identityCardNumber, phoneNumber, email);
        this.employeeCode = employeeCode;
        this.salary = salary;
        this.address = address;
        this.position = position;
        this.educationDegree = educationDegree;
        this.division = division;
        this.userName = userName;
    }

    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getEducationDegree() {
        return educationDegree;
    }

    public void setEducationDegree(int educationDegree) {
        this.educationDegree = educationDegree;
    }

    public int getDivision() {
        return division;
    }

    public void setDivision(int division) {
        this.division = division;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
