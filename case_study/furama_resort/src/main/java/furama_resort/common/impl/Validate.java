package furama_resort.common.impl;

import furama_resort.bean.*;
import furama_resort.common.ICommon;

import java.util.Date;
import java.util.regex.Pattern;

public class Validate implements ICommon {
    public  boolean checkCustomer(Customer customer) {
        if (!Pattern.matches("^(KH|DV|HD|NV)\\d{4}$", customer.getCustomerCode())) {
            return false;
        } else if (!Pattern.matches("^(090|091|8490|8491)\\d{7}$", customer.getPhoneNumber())) {
            return false;
        }else if (!Pattern.matches("^\\w+@\\w+(\\.\\w+){1,2}$", customer.getEmail())){
            return false;
        }else if (!Pattern.matches("^\\d{9,12}$", customer.getIdentityCardNumber())){
            return false;
        }
//        Date date = new Date();
//        date.getTime();
//        customer.getDateOfBirth();
        return true;
    }

    @Override
    public boolean checkService(ServiceResort service) {
        if (!Pattern.matches("^(KH|DV|HD|NV)\\d{4}$", service.getCodeService())) {
            return false;
        } else if (service.getRentCost()<0||service.getUsableArea()<0|service.getNumberOfFloors()<0|
        service.getNumberOfPeople()<0|service.getPoolArea()<0) {
            return false;
        }
        return true;
    }

    @Override
    public boolean checkEmployee(Employee employee) {
        if (!Pattern.matches("^(KH|DV|HD|NV)\\d{4}$", employee.getEmployeeCode())) {
            return false;
        } else if (!Pattern.matches("^(090|091|8490|8491)\\d{7}$", employee.getPhoneNumber())) {
            return false;
        }else if (!Pattern.matches("^\\w+@\\w+(\\.\\w+){1,2}$", employee.getEmail())){
            return false;
        }else if (!Pattern.matches("^\\d{9,12}$", employee.getIdentityCardNumber())){
            return false;
        }else if(employee.getSalary()<0){
            return false;
        }
        return true;
    }

    @Override
    public boolean checkContract(Contract contract) {
        if (!Pattern.matches("^(KH|DV|HD|NV)\\d{4}$", contract.getContractCode())) {
            return false;
        }else if(contract.getContractDeposit()<0 | contract.getContractTotalMoney()<0){
            return false;
        }
        return true;
    }



}
