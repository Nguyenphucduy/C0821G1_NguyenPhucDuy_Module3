package furama_resort.bean;

public class ServiceAttach {
    private int attachServiceCode;
    private String attachServiceName;
    private String attachServiceUnit;
    private double attachServiceCost;
    private Integer attachServiceQuantity;
    private String attachServiceStatus;

    public ServiceAttach() {
    }

    public ServiceAttach(int attachServiceCode, String attachServiceName, String attachServiceUnit, double attachServiceCost, Integer attachServiceQuantity, String attachServiceStatus) {
        this.attachServiceCode = attachServiceCode;
        this.attachServiceName = attachServiceName;
        this.attachServiceUnit = attachServiceUnit;
        this.attachServiceCost = attachServiceCost;
        this.attachServiceQuantity = attachServiceQuantity;
        this.attachServiceStatus = attachServiceStatus;
    }

    public int getAttachServiceCode() {
        return attachServiceCode;
    }

    public void setAttachServiceCode(int attachServiceCode) {
        this.attachServiceCode = attachServiceCode;
    }

    public String getAttachServiceName() {
        return attachServiceName;
    }

    public void setAttachServiceName(String attachServiceName) {
        this.attachServiceName = attachServiceName;
    }

    public String getAttachServiceUnit() {
        return attachServiceUnit;
    }

    public void setAttachServiceUnit(String attachServiceUnit) {
        this.attachServiceUnit = attachServiceUnit;
    }

    public double getAttachServiceCost() {
        return attachServiceCost;
    }

    public void setAttachServiceCost(double attachServiceCost) {
        this.attachServiceCost = attachServiceCost;
    }

    public Integer getAttachServiceQuantity() {
        return attachServiceQuantity;
    }

    public void setAttachServiceQuantity(Integer attachServiceQuantity) {
        this.attachServiceQuantity = attachServiceQuantity;
    }

    public String getAttachServiceStatus() {
        return attachServiceStatus;
    }

    public void setAttachServiceStatus(String attachServiceStatus) {
        this.attachServiceStatus = attachServiceStatus;
    }
}
