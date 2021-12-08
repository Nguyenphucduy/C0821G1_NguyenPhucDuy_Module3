package furama_resort.repository.impl;

import furama_resort.bean.*;
import furama_resort.repository.IRepositoryService;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RepositoryService implements IRepositoryService {
    @Override
    public void createCustomer(Customer customer) throws SQLException {

        String query = "INSERT INTO customer \n" +
                "VALUES (?,?,?,?,?,?,?,?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, customer.getCustomerCode());
        preparedStatement.setString(2, customer.getFullName());
        preparedStatement.setString(3, customer.getDateOfBirth());
        preparedStatement.setString(4, customer.getGender());
        preparedStatement.setString(5, customer.getIdentityCardNumber());
        preparedStatement.setString(6, customer.getPhoneNumber());
        preparedStatement.setString(7, customer.getEmail());
        preparedStatement.setString(8, customer.getAddress());
        preparedStatement.setString(9, String.valueOf(customer.getCustomerType()));

        preparedStatement.executeUpdate();
    }

    @Override
    public List<Customer> getListCustomer() {
        List<Customer> customerList = new ArrayList<>();

        String query = "select * \n" +
                "from customer;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            Customer customer ;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerCode(resultSet.getString("customer_id"));
                customer.setFullName(resultSet.getString("customer_name"));
                customer.setDateOfBirth(resultSet.getString("customer_birthday"));
                customer.setGender(resultSet.getString("customer_gender"));
                customer.setIdentityCardNumber(resultSet.getString("customer_id_card"));
                customer.setPhoneNumber(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setCustomerCode(resultSet.getString("customer_id"));
                customer.setAddress(resultSet.getString("customer_address"));
                customer.setCustomerType(Integer.parseInt(resultSet.getString("customer_type_id")));

                customerList.add(customer);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerList;
    }

    @Override
    public void deleteCustomer(String customerCode) throws SQLException {
        String query = "delete \n" +
                "from customer \n" +
                "where customer_id = ?;";


        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);

        preparedStatement.setString(1, customerCode);
        preparedStatement.executeUpdate();

    }

    @Override
    public Customer selectByCustomerCode(String customerCode) {
        Customer customer = null;
        String query = "select customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address,customer_type_id\n" +
                "from customer\n" +
                "where customer_id = ?;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, (customerCode));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("customer_name");
                String dateOfBirth = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int typeId = Integer.parseInt(resultSet.getString("customer_type_id"));

                customer = new Customer(name, dateOfBirth, gender, idCard, phone, email, address, typeId);
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return customer;
    }

    @Override
    public void updateData(Customer customer) {

        String query = "update customer\n" +
                "set customer_name = ?,customer_birthday = ?,customer_gender = ?,customer_id_card = ?\n" +
                ",customer_phone = ? ,customer_email = ?,customer_address = ?,customer_type_id = ?\n" +
                "where customer_id = ?;";
        try {
            PreparedStatement statement =
                    BaseRepository.connection.prepareStatement(query);
            statement.setString(1, customer.getFullName());
            statement.setString(2, customer.getDateOfBirth());
            statement.setString(3, customer.getGender());
            statement.setString(4, customer.getIdentityCardNumber());
            statement.setString(5, customer.getPhoneNumber());
            statement.setString(6, customer.getEmail());
            statement.setString(7, customer.getAddress());
            statement.setString(8, String.valueOf(customer.getCustomerType()));
            statement.setString(9, String.valueOf(customer.getCustomerCode()));

            statement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> selectByName(String name) {
        List<Customer> customerList = new ArrayList<>();

        String nameFix = ""+name+"%";


        String query = "select * \n" +
                "from customer\n" +
                "where customer_name like ?  \n" +
                "order by customer_name;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, nameFix);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String codeCustomer = resultSet.getString("customer_id");
                String nameCustomer = resultSet.getString("customer_name");
                String birthdayCustomer = resultSet.getString("customer_birthday");
                String genderCustomer = resultSet.getString("customer_gender");
                String idCardCustomer = resultSet.getString("customer_id_card");
                String phoneCustomer = resultSet.getString("customer_phone");
                String emailCustomer = resultSet.getString("customer_email");
                String addressCustomer = resultSet.getString("customer_address");
                int idTypeCustomer = Integer.parseInt(resultSet.getString("customer_type_id"));

                customerList.add(new Customer( nameCustomer, birthdayCustomer, genderCustomer,idCardCustomer,phoneCustomer,emailCustomer,codeCustomer,addressCustomer,idTypeCustomer));
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return customerList;
    }
// Service -------------------------------------------------------------------
    @Override
    public List<ServiceResort> getListService() {
        List<ServiceResort> serviceResortList = new ArrayList<>();

        String query = "select *\n" +
                "from service;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            ServiceResort serviceResort ;
            while (resultSet.next()) {
                serviceResort = new ServiceResort();


                serviceResort.setCodeService(resultSet.getString("service_id"));
                serviceResort.setNameService(resultSet.getString("service_name"));
                serviceResort.setUsableArea(Double.parseDouble(resultSet.getString("service_area")));
                serviceResort.setRentCost(Double.parseDouble(resultSet.getString("service_cost")));
                serviceResort.setNumberOfPeople(Integer.parseInt(resultSet.getString("service_max_people")));
                serviceResort.setStandardRoom(resultSet.getString("standard_room"));
                serviceResort.setDescriptionOtherConvenience(resultSet.getString("description_other_convenience"));
                serviceResort.setPoolArea(Double.parseDouble(resultSet.getString("pool_area")));
                serviceResort.setNumberOfFloors(Integer.parseInt(resultSet.getString("number_of_floors")));
                serviceResort.setServiceTypeId(Integer.parseInt(resultSet.getString("service_type_id")));
                serviceResort.setRentalType(Integer.parseInt(resultSet.getString("rent_type_id")));



                serviceResortList.add(serviceResort);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return serviceResortList;
    }

    @Override
    public void createService(ServiceResort serviceResort) throws SQLException {
        String query = "insert into service\n" +
                "values \n" +
                "(?,?,?,?,?,?,?,?,?,?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, serviceResort.getCodeService());
        preparedStatement.setString(2, serviceResort.getNameService());
        preparedStatement.setString(3, String.valueOf(serviceResort.getUsableArea()));
        preparedStatement.setString(4, String.valueOf(serviceResort.getRentCost()));
        preparedStatement.setString(5, String.valueOf(serviceResort.getNumberOfPeople()));
        preparedStatement.setString(6, serviceResort.getStandardRoom());
        preparedStatement.setString(7, serviceResort.getDescriptionOtherConvenience());
        preparedStatement.setString(8, String.valueOf(serviceResort.getPoolArea()));
        preparedStatement.setString(9, String.valueOf(serviceResort.getNumberOfFloors()));
        preparedStatement.setString(10, String.valueOf(serviceResort.getRentalType()));
        preparedStatement.setString(11, String.valueOf(serviceResort.getServiceTypeId()));

        preparedStatement.executeUpdate();
    }

    @Override
    public void deleteService(String codeService) throws SQLException {
        String query = "delete \n" +
                "from service \n" +
                "where service_id = ?;";


        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);

        preparedStatement.setString(1, codeService);
        preparedStatement.executeUpdate();
    }

    @Override
    public List<ServiceResort> selectServiceByName(String name) {
        List<ServiceResort> serviceResortList = new ArrayList<>();

        String nameFix = ""+name+"%";


        String query = "select * \n" +
                "from service\n" +
                "where service_name like ?  \n" +
                "order by service_name;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, nameFix);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String  service_id = resultSet.getString("service_id");
                String  service_name = resultSet.getString("service_name");
                double service_area = Double.parseDouble(resultSet.getString("service_area"));
                double  service_cost = Double.parseDouble(resultSet.getString("service_cost"));
                int service_max_people = Integer.parseInt(resultSet.getString("service_max_people"));
                String  standard_room = resultSet.getString("standard_room");
                String description_other_convenience = resultSet.getString("description_other_convenience");
                double  pool_area = Double.parseDouble(resultSet.getString("pool_area"));
                int number_of_floors = Integer.parseInt(resultSet.getString("number_of_floors"));
                int  service_type_id = Integer.parseInt(resultSet.getString("service_type_id"));
                int rent_type_id = Integer.parseInt(resultSet.getString("rent_type_id"));




                serviceResortList.add(new ServiceResort(service_id,service_name,service_area,service_cost,service_max_people,service_type_id,rent_type_id,standard_room,description_other_convenience,pool_area,number_of_floors));
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return serviceResortList;
    }

    @Override
    public ServiceResort selectServiceByCode(String codeService) {
        ServiceResort serviceResort = null;
        String query = "select *" +
                "from service\n" +
                "where service_id = ?;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, (codeService));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                serviceResort = new ServiceResort();

                serviceResort.setCodeService(codeService);
                serviceResort.setNameService(resultSet.getString("service_name"));
                serviceResort.setUsableArea(Double.parseDouble(resultSet.getString("service_area")));
                serviceResort.setRentCost(Double.parseDouble(resultSet.getString("service_cost")));
                serviceResort.setNumberOfPeople(Integer.parseInt(resultSet.getString("service_max_people")));
                serviceResort.setStandardRoom(resultSet.getString("standard_room"));
                serviceResort.setDescriptionOtherConvenience(resultSet.getString("description_other_convenience"));
                serviceResort.setPoolArea(Double.parseDouble(resultSet.getString("pool_area")));
                serviceResort.setNumberOfFloors(Integer.parseInt(resultSet.getString("number_of_floors")));
                serviceResort.setServiceTypeId(Integer.parseInt(resultSet.getString("service_type_id")));
                serviceResort.setRentalType(Integer.parseInt(resultSet.getString("rent_type_id")));
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return serviceResort;
    }

    @Override
    public void updateService(ServiceResort serviceResort) {

        String query = "update service\n" +
                "set  service_name = ?, service_area = ?, service_cost = ?,service_max_people = ?, standard_room = ?,description_other_convenience =?,pool_area= ?,number_of_floors = ?,rent_type_id = ?, service_type_id =?\n" +
                "where service_id = ?;";
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.connection.prepareStatement(query);

            preparedStatement.setString(1, serviceResort.getNameService());
            preparedStatement.setString(2, String.valueOf(serviceResort.getUsableArea()));
            preparedStatement.setString(3, String.valueOf(serviceResort.getRentCost()));
            preparedStatement.setString(4, String.valueOf(serviceResort.getNumberOfPeople()));
            preparedStatement.setString(5, serviceResort.getStandardRoom());
            preparedStatement.setString(6, serviceResort.getDescriptionOtherConvenience());
            preparedStatement.setString(7, String.valueOf(serviceResort.getPoolArea()));
            preparedStatement.setString(8, String.valueOf(serviceResort.getNumberOfFloors()));
            preparedStatement.setString(9, String.valueOf(serviceResort.getRentalType()));
            preparedStatement.setString(10, String.valueOf(serviceResort.getServiceTypeId()));
            preparedStatement.setString(11, serviceResort.getCodeService());

            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Employee> getListEmployee() {
        List<Employee> employeeList = new ArrayList<>();

        String query = "select * \n" +
                "from employee;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            Employee employee ;
            while (resultSet.next()) {
                employee = new Employee();


                employee.setEmployeeCode(resultSet.getString("employee_id"));
                employee.setFullName(resultSet.getString("employee_name"));
                employee.setDateOfBirth(resultSet.getString("employee_birthday"));
                employee.setIdentityCardNumber(resultSet.getString("employee_id_card"));
                employee.setSalary(Double.parseDouble(resultSet.getString("employee_salary")));
                employee.setPhoneNumber(resultSet.getString("employee_phone"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));
                employee.setPosition(Integer.parseInt(resultSet.getString("position_id")));
                employee.setEducationDegree(Integer.parseInt(resultSet.getString("education_degree_id")));
                employee.setDivision(Integer.parseInt(resultSet.getString("division_id")));
                employee.setUserName(resultSet.getString("user_name"));


                employeeList.add(employee);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public void createEmployee(Employee employee) throws SQLException {
        String query = "insert into employee\n" +
                "values \n" +
                "(?,?,?,?,?,?,?,?,?,?,?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, employee.getEmployeeCode());
        preparedStatement.setString(2, employee.getFullName());
        preparedStatement.setString(3, employee.getDateOfBirth());
        preparedStatement.setString(4,employee.getIdentityCardNumber());
        preparedStatement.setString(5, String.valueOf(employee.getSalary()));
        preparedStatement.setString(6, employee.getPhoneNumber());
        preparedStatement.setString(7, employee.getEmail());
        preparedStatement.setString(8, employee.getAddress());
        preparedStatement.setString(9, String.valueOf(employee.getPosition()));
        preparedStatement.setString(10, String.valueOf(employee.getEducationDegree()));
        preparedStatement.setString(11, String.valueOf(employee.getDivision()));
        preparedStatement.setString(12, employee.getUserName());

        preparedStatement.executeUpdate();
    }

    @Override
    public void deleteEmployee(String code) throws SQLException {
        String query = "delete \n" +
                "from employee \n" +
                "where employee_id = ?;";


        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);

        preparedStatement.setString(1, code);
        preparedStatement.executeUpdate();
    }

    @Override
    public Employee selectByEmployeeCode(String code) {
        Employee employee = null;
        String query = "select *" +
                "from employee\n" +
                "where employee_id = ?;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, (code));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();

                employee.setEmployeeCode(code);
                employee.setFullName(resultSet.getString("employee_name"));
                employee.setDateOfBirth(resultSet.getString("employee_birthday"));
                employee.setIdentityCardNumber(resultSet.getString("employee_id_card"));
                employee.setSalary(Double.parseDouble(resultSet.getString("employee_salary")));
                employee.setPhoneNumber(resultSet.getString("employee_phone"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));
                employee.setPosition(Integer.parseInt(resultSet.getString("position_id")));
                employee.setEducationDegree(Integer.parseInt(resultSet.getString("education_degree_id")));
                employee.setDivision(Integer.parseInt(resultSet.getString("division_id")));
                employee.setUserName(resultSet.getString("user_name"));
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return employee;
    }

    @Override
    public void editEmployee(Employee employee) {
        String query = "update employee\n" +
                "set employee_name = ?,employee_birthday = ? ,employee_id_card = ? , employee_salary = ?, employee_phone = ?, employee_email = ?, employee_address = ?, position_id = ? ,education_degree_id = ? ,division_id = ?, user_name = ?\n" +
                "where employee_id = ?;";
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.connection.prepareStatement(query);
            preparedStatement.setString(1, employee.getFullName());
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3,employee.getIdentityCardNumber());
            preparedStatement.setString(4, String.valueOf(employee.getSalary()));
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setString(8, String.valueOf(employee.getPosition()));
            preparedStatement.setString(9, String.valueOf(employee.getEducationDegree()));
            preparedStatement.setString(10, String.valueOf(employee.getDivision()));
            preparedStatement.setString(11, employee.getUserName());
            preparedStatement.setString(12, employee.getEmployeeCode());

            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Employee> selectByEmployeeName(String name) {
        List<Employee> employeeList = new ArrayList<>();

        String nameFix = ""+name+"%";

        String query = "select * \n" +
                "from employee\n" +
                "where employee_name like ? \n" +
                "order by employee_name;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, nameFix);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Employee employee = new Employee();

                employee.setEmployeeCode(resultSet.getString("employee_id"));
                employee.setFullName(resultSet.getString("employee_name"));
                employee.setDateOfBirth(resultSet.getString("employee_birthday"));
                employee.setIdentityCardNumber(resultSet.getString("employee_id_card"));
                employee.setSalary(Double.parseDouble(resultSet.getString("employee_salary")));
                employee.setPhoneNumber(resultSet.getString("employee_phone"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));
                employee.setPosition(Integer.parseInt(resultSet.getString("position_id")));
                employee.setEducationDegree(Integer.parseInt(resultSet.getString("education_degree_id")));
                employee.setDivision(Integer.parseInt(resultSet.getString("division_id")));
                employee.setUserName(resultSet.getString("user_name"));




                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return employeeList;
    }
// Contract--------------------------------------------------------------------------------------------
    @Override
    public List<Contract> getListContract() {
        List<Contract> contractList = new ArrayList<>();

        String query = "select *\n" +
                "from contract;";
//        String query2 = "select contract.contract_id,contract.contract_start_date,contract.contract_end_date,contract.contract_deposit\n" +
//                ",sum((attach_service.attach_service_quantity*rent_type.rent_type_cost) + service.service_cost) as contract_total_money,contract.employee_id,\n" +
//                "contract.customer_id, contract.service_id\n" +
//                "from contract\n" +
//                "left join contract_detail on contract.contract_id = contract_detail.contract_id\n" +
//                "left join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id\n" +
//                "left join service on contract.service_id = service.service_id\n" +
//                "left join rent_type on service.rent_type_id = rent_type.rent_type_id\n" +
//                "group by contract.contract_id;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
//            ResultSet resultSet = statement.executeQuery(query2);

            Contract contract ;
            while (resultSet.next()) {
                contract = new Contract();


                contract.setContractCode(resultSet.getString("contract_id"));
                contract.setContractStartDate(resultSet.getString("contract_start_date"));
                contract.setContractEndDate(resultSet.getString("contract_end_date"));
                contract.setContractDeposit(Double.parseDouble(resultSet.getString("contract_deposit")));
                contract.setContractTotalMoney(Double.parseDouble(resultSet.getString("contract_total_money")));
                contract.setEmployeeCode(resultSet.getString("employee_id"));
                contract.setCustomerCode(resultSet.getString("customer_id"));
                contract.setServiceCode(resultSet.getString("service_id"));

               contractList.add(contract);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return contractList;
    }

    @Override
    public void createContract(Contract contract) throws SQLException {
        String query = "insert into contract\n" +
                "values \n" +
                "(?,?,?,?,?,?,?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, contract.getContractCode());
        preparedStatement.setString(2, contract.getContractStartDate());
        preparedStatement.setString(3, contract.getContractEndDate());
        preparedStatement.setString(4, String.valueOf(contract.getContractDeposit()));
        preparedStatement.setString(5, String.valueOf(contract.getContractTotalMoney()));
        preparedStatement.setString(6, contract.getEmployeeCode());
        preparedStatement.setString(7, contract.getCustomerCode());
        preparedStatement.setString(8, contract.getServiceCode());

        preparedStatement.executeUpdate();
    }

    @Override
    public void deleteContract(String code) throws SQLException {
        String query = " delete \n" +
                " from contract \n" +
                " where contract_id = ?;";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, code);


        preparedStatement.executeUpdate();
    }

    @Override
    public Contract selectByContractCode(String code) {
        Contract contract = null;
        String query = "select *" +
                "from contract\n" +
                "where contract_id = ?;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, (code));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                contract = new Contract();

                contract.setContractCode(code);
                contract.setContractStartDate(resultSet.getString("contract_start_date"));
                contract.setContractEndDate(resultSet.getString("contract_end_date"));
                contract.setContractDeposit(Double.parseDouble(resultSet.getString("contract_deposit")));
                contract.setContractTotalMoney(Double.parseDouble(resultSet.getString("contract_total_money")));
                contract.setEmployeeCode(resultSet.getString("employee_id"));
                contract.setCustomerCode(resultSet.getString("customer_id"));
                contract.setServiceCode(resultSet.getString("service_id"));
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return contract;
    }

    @Override
    public void editContract(Contract contract) {
        String query = "update contract \n" +
                "set contract_start_date = ?,contract_end_date = ? ,contract_deposit = ? , contract_total_money = ?, employee_id = ?, customer_id = ?, service_id = ?\n" +
                "where contract_id = ?;";
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.connection.prepareStatement(query);
            preparedStatement.setString(1, contract.getContractStartDate());
            preparedStatement.setString(2, contract.getContractEndDate());
            preparedStatement.setString(3, String.valueOf(contract.getContractDeposit()));
            preparedStatement.setString(4, String.valueOf(contract.getContractTotalMoney()));
            preparedStatement.setString(5, contract.getEmployeeCode());
            preparedStatement.setString(6, contract.getCustomerCode());
            preparedStatement.setString(7, contract.getServiceCode());
            preparedStatement.setString(8, contract.getContractCode());

            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<ContractDetail> getListContractDetail() {
        List<ContractDetail> contractDetailList = new ArrayList<>();

        String query = "select * \n" +
                "from contract_detail;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            ContractDetail contractDetail ;
            while (resultSet.next()) {
                contractDetail = new ContractDetail();


                contractDetail.setContractDetailCode(Integer.parseInt(resultSet.getString("contract_detail_id")));
                contractDetail.setContractCode(resultSet.getString("contract_id"));
                contractDetail.setAttachServiceCode(Integer.parseInt(resultSet.getString("attach_service_id")));


                contractDetailList.add(contractDetail);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return contractDetailList;
    }

    @Override
    public void createContractDetail(ContractDetail contractDetail) throws SQLException {

        String query = "insert into contract_detail\n" +
                "(contract_id,attach_service_id)\n" +
                "values \n" +
                "(?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, contractDetail.getContractCode());
        preparedStatement.setString(2, String.valueOf(contractDetail.getAttachServiceCode()));

        preparedStatement.executeUpdate();
    }
// List Customer Using Service
    @Override
    public List<Customer> getListCustomerUsingService() {
        List<Customer> customerList = new ArrayList<>();


        String query = "select  customer.customer_id,customer.customer_name,customer.customer_birthday,customer.customer_gender,customer.customer_id_card,customer.customer_phone,customer.customer_email,customer.customer_address,customer.customer_type_id,attach_service.attach_service_name\n" +
                "from customer\n" +
                "join contract on customer.customer_id = contract.customer_id\n" +
                "join service on contract.service_id = service.service_id\n" +
                "join contract_detail on contract.contract_id = contract_detail.contract_id\n" +
                "join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id\n" +
                "group by customer.customer_id,attach_service.attach_service_id;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            Customer customer ;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerCode(resultSet.getString("customer_id"));
                customer.setFullName(resultSet.getString("customer_name"));
                customer.setDateOfBirth(resultSet.getString("customer_birthday"));
                customer.setGender(resultSet.getString("customer_gender"));
                customer.setIdentityCardNumber(resultSet.getString("customer_id_card"));
                customer.setPhoneNumber(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setCustomerCode(resultSet.getString("customer_id"));
                customer.setAddress(resultSet.getString("customer_address"));
                customer.setCustomerType(Integer.parseInt(resultSet.getString("customer_type_id")));

                customerList.add(customer);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerList;
    }

    @Override
    public List<ServiceAttach> getListAttachService() {
        List<ServiceAttach> serviceAttachList = new ArrayList<>();


        String query = "select attach_service.attach_service_id,attach_service.attach_service_name,attach_service.attach_service_cost,attach_service.attach_service_unit,attach_service.attach_service_quantity,attach_service.attach_service_status\n" +
                "from customer\n" +
                "join contract on customer.customer_id = contract.customer_id\n" +
                "join service on contract.service_id = service.service_id\n" +
                "join contract_detail on contract.contract_id = contract_detail.contract_id\n" +
                "join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id\n" +
                "group by customer.customer_id,attach_service.attach_service_id;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            ServiceAttach serviceAttach ;
            while (resultSet.next()) {
                serviceAttach = new ServiceAttach();
                serviceAttach.setAttachServiceCode(Integer.parseInt(resultSet.getString("attach_service_id")));
                serviceAttach.setAttachServiceName(resultSet.getString("attach_service_name"));
                serviceAttach.setAttachServiceCost(Double.parseDouble(resultSet.getString("attach_service_cost")));
                serviceAttach.setAttachServiceUnit(resultSet.getString("attach_service_unit"));
                serviceAttach.setAttachServiceQuantity(Integer.valueOf(resultSet.getString("attach_service_quantity")));
                serviceAttach.setAttachServiceStatus(resultSet.getString("attach_service_status"));

                serviceAttachList.add(serviceAttach);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return serviceAttachList;
    }

    @Override
    public void createUserEmployee(UserEmployee userEmployee) throws SQLException {

        String query = "insert into user\n" +
                "values\n" +
                "(?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, userEmployee.getUserName());
        preparedStatement.setString(2, userEmployee.getPassword());


        preparedStatement.executeUpdate();
    }
    @Override
    public void createUserEmployeeMore(UserEmployee userEmployee) throws SQLException {

        String query = "insert into user\n" +
                "(user_name)\n" +
                "values\n" +
                "(?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, userEmployee.getUserName());


        preparedStatement.executeUpdate();
    }
}
