package furama_resort.bean;

public class House extends ServiceResort {
    private String roomStandard;
    private String descriptionOtherConvenience;
    private int numberOfFloors;

    public House() {
    }

    public House(String roomStandard, String descriptionOtherConvenience, int numberOfFloors) {
        this.roomStandard = roomStandard;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.numberOfFloors = numberOfFloors;
    }

    public House(String codeService, String nameService, double usableArea, double rentCost, int numberOfPeople, int serviceTypeId, int rentalType, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String roomStandard, String descriptionOtherConvenience1, int numberOfFloors1) {
        super(codeService, nameService, usableArea, rentCost, numberOfPeople, serviceTypeId, rentalType, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors);
        this.roomStandard = roomStandard;
        this.descriptionOtherConvenience = descriptionOtherConvenience1;
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
    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    @Override
    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }
}
