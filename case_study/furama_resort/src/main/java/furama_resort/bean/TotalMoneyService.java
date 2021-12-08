package furama_resort.bean;

public class TotalMoneyService {
    private String nameService;
    private double totalMoneyService;

    public TotalMoneyService() {
    }

    public TotalMoneyService(String nameService, double totalMoneyService) {
        this.nameService = nameService;
        this.totalMoneyService = totalMoneyService;
    }

    public String getNameService() {
        return nameService;
    }

    public void setNameService(String nameService) {
        this.nameService = nameService;
    }

    public double getTotalMoneyService() {
        return totalMoneyService;
    }

    public void setTotalMoneyService(double totalMoneyService) {
        this.totalMoneyService = totalMoneyService;
    }
}
