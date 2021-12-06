package furama_resort.bean;

public class Room extends ServiceResort {
    private String serviceFree;

    public Room() {
    }


    public Room(String serviceFree) {
        this.serviceFree = serviceFree;
    }

    public Room(String codeService, String nameService, double usableArea, double rentCost, int numberOfPeople, int serviceTypeId, int rentalType, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String serviceFree) {
        super(codeService, nameService, usableArea, rentCost, numberOfPeople, serviceTypeId, rentalType, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors);
        this.serviceFree = serviceFree;
    }

    public String getServiceFree() {
        return serviceFree;
    }

    public void setServiceFree(String serviceFree) {
        this.serviceFree = serviceFree;
    }
}
