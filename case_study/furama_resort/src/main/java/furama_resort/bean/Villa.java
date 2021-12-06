package furama_resort.bean;

public class Villa extends ServiceResort {
    private String roomStandard;
    private String descriptionOtherConvenience;
    private double poolArea;
    private int numberOfFloors;

    public Villa() {
    }

    public Villa(String roomStandard, String descriptionOtherConvenience, double poolArea, int numberOfFloors) {
        this.roomStandard = roomStandard;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
    }

    public Villa(String codeService, String nameService, double usableArea, double rentCost, int numberOfPeople, int serviceTypeId, int rentalType, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String roomStandard, String descriptionOtherConvenience1, double poolArea1, int numberOfFloors1) {
        super(codeService, nameService, usableArea, rentCost, numberOfPeople, serviceTypeId, rentalType, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors);
        this.roomStandard = roomStandard;
        this.descriptionOtherConvenience = descriptionOtherConvenience1;
        this.poolArea = poolArea1;
        this.numberOfFloors = numberOfFloors1;
    }

    public String getRoomStandard() {
        return roomStandard;
    }

    public void setRoomStandard(String roomStandard) {
        this.roomStandard = roomStandard;
    }

    @Override
    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    @Override
    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    @Override
    public double getPoolArea() {
        return poolArea;
    }

    @Override
    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    @Override
    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    @Override
    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }
}
