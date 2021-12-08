package furama_resort.common.impl;

import furama_resort.bean.*;
import furama_resort.common.ICommon;


import java.util.regex.Pattern;

public class Validate implements ICommon {
    public boolean checkCustomer(Customer customer) {
        String dateOfBirth = customer.getDateOfBirth();
        String today = String.valueOf(java.time.LocalDate.now());

        String[] string1 = dateOfBirth.split("-");
        String[] string2 = today.split("-");
        String year1 = string1[0];
        String year2 = string2[0];
        int result = Integer.parseInt(year2) - Integer.parseInt(year1);
        if (!Pattern.matches("^(KH|DV|HD|NV)\\d{4}$", customer.getCustomerCode())) {
            return false;
        } else if (!Pattern.matches("^(090|091|8490|8491)\\d{7}$", customer.getPhoneNumber())) {
            return false;
        } else if (!Pattern.matches("^\\w+@\\w+(\\.\\w+){1,2}$", customer.getEmail())) {
            return false;
        } else if (!Pattern.matches("^\\d{9,12}$", customer.getIdentityCardNumber())) {
            return false;
        }else if (result <=18 ){
            return false;
        }
        return true;
    }

    @Override
    public boolean checkService(ServiceResort service) {
        if (!Pattern.matches("^(KH|DV|HD|NV)\\d{4}$", service.getCodeService())) {
            return false;
        } else if (service.getRentCost() < 0 | service.getUsableArea() < 0 | service.getNumberOfFloors() < 0 |
                service.getNumberOfPeople() < 0 | service.getPoolArea() < 0) {
            return false;
        }
        return true;
    }

    @Override
    public boolean checkEmployee(Employee employee) {
        String dateOfBirth = employee.getDateOfBirth();
        String today = String.valueOf(java.time.LocalDate.now());

        String[] string1 = dateOfBirth.split("-");
        String[] string2 = today.split("-");
        String year1 = string1[0];
        String year2 = string2[0];
        int result = Integer.parseInt(year2) - Integer.parseInt(year1);


        if (!Pattern.matches("^(KH|DV|HD|NV)\\d{4}$", employee.getEmployeeCode())) {
            return false;
        } else if (!Pattern.matches("^(090|091|8490|8491)\\d{7}$", employee.getPhoneNumber())) {
            return false;
        } else if (!Pattern.matches("^\\w+@\\w+(\\.\\w+){1,2}$", employee.getEmail())) {
            return false;
        } else if (!Pattern.matches("^\\d{9,12}$", employee.getIdentityCardNumber())) {
            return false;
        } else if (employee.getSalary() < 0) {
            return false;
        } else if (result <= 18) {
            return false;
        }

        return true;
    }

    @Override
    public boolean checkContract(Contract contract) {
        String dateOfBirth = contract.getContractStartDate();
        String dateOfBirth2 = contract.getContractStartDate();

        String[] string1 = dateOfBirth.split("-");
        String[] string2 = dateOfBirth2.split("-");
        String year1 = string1[0];
        String year2 = string2[0];
        String month1 = string1[1];
        String month2 = string2[1];
        String day1 = string1[2];
        String day2 = string2[2];
        int result1 = Integer.parseInt(year2) - Integer.parseInt(year1);
        int result2 = Integer.parseInt(month2) - Integer.parseInt(month1);
        int result3 = Integer.parseInt(day2) - Integer.parseInt(day1);
        int result = result1+result2+result3;
        if (!Pattern.matches("^(KH|DV|HD|NV)\\d{4}$", contract.getContractCode())) {
            return false;
        } else if (contract.getContractDeposit() < 0 | contract.getContractTotalMoney() < 0) {
            return false;
        }else if (result<=0){
            return false;
        }
        return true;
    }


}
