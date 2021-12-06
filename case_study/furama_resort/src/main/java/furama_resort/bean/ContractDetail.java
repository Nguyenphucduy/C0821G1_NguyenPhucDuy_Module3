package furama_resort.bean;

public class ContractDetail {
    private int contractDetailCode;
    private String contractCode;
    private int attachServiceCode;

    public ContractDetail() {
    }

    public ContractDetail(int contractDetailCode, String contractCode, int attachServiceCode) {
        this.contractDetailCode = contractDetailCode;
        this.contractCode = contractCode;
        this.attachServiceCode = attachServiceCode;

    }

    public ContractDetail(String contractCode, int attachServiceCode) {
        this.contractCode = contractCode;
        this.attachServiceCode = attachServiceCode;
    }

    public int getContractDetailCode() {
        return contractDetailCode;
    }

    public void setContractDetailCode(int contractDetailCode) {
        this.contractDetailCode = contractDetailCode;
    }

    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode;
    }

    public int getAttachServiceCode() {
        return attachServiceCode;
    }

    public void setAttachServiceCode(int attachServiceCode) {
        this.attachServiceCode = attachServiceCode;
    }
}
