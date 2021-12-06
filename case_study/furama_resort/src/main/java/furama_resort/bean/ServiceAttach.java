package furama_resort.bean;

public class ServiceAttach {
    private String attachServiceName;
    private String attachServiceUnit;
    private double attachServiceCost;
    private Integer attachServiceQuantity;
    private Boolean attachServiceStatus;

    public ServiceAttach() {
    }

    public ServiceAttach(String attachServiceName, String attachServiceUnit, double attachServiceCost, Integer attachServiceQuantity, Boolean attachServiceStatus) {
        this.attachServiceName = attachServiceName;
        this.attachServiceUnit = attachServiceUnit;
        this.attachServiceCost = attachServiceCost;
        this.attachServiceQuantity = attachServiceQuantity;
        this.attachServiceStatus = attachServiceStatus;
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

    public Boolean getAttachServiceStatus() {
        return attachServiceStatus;
    }

    public void setAttachServiceStatus(Boolean attachServiceStatus) {
        this.attachServiceStatus = attachServiceStatus;
    }
}
