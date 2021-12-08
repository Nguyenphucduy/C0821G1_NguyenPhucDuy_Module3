package furama_resort.common;

import furama_resort.bean.*;

import java.util.regex.Pattern;

public interface ICommon {
    boolean checkCustomer(Customer customer);

    boolean checkService(ServiceResort service);

    boolean checkEmployee(Employee employee);
    boolean checkContract(Contract contract);

}
