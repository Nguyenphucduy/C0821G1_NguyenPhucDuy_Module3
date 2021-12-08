package furama_resort.repository.service.impl;

import furama_resort.bean.ServiceResort;
import furama_resort.bean.TotalMoneyService;
import furama_resort.repository.BaseRepository;
import furama_resort.repository.service.IRepositoryService;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RepositoryService implements IRepositoryService {
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
    public List<TotalMoneyService> getListTotalMoneyService() {
        List<TotalMoneyService> totalMoneyServiceList = new ArrayList<>();

        String query = "select sum((attach_service.attach_service_quantity*rent_type.rent_type_cost) + service.service_cost) as contract_total_money,service.service_name\n" +
                "from contract\n" +
                " join contract_detail on contract.contract_id = contract_detail.contract_id\n" +
                "join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id\n" +
                " join service on contract.service_id = service.service_id\n" +
                " join rent_type on service.rent_type_id = rent_type.rent_type_id\n" +
                "group by contract.contract_id;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            TotalMoneyService totalMoneyService ;
            while (resultSet.next()) {
                totalMoneyService = new TotalMoneyService();

                totalMoneyService.setTotalMoneyService(Double.parseDouble(resultSet.getString("contract_total_money")));
                totalMoneyService.setNameService(resultSet.getString("service_name"));





                totalMoneyServiceList.add(totalMoneyService);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return totalMoneyServiceList;
    }

}
