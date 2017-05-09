package travel.carpool.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import travel.carpool.model.Carpool;
import travel.carpool.model.Carpool_Request;
import travel.carpool.model.Search;

public interface CarpoolMapper {
	int insertCarpool(Carpool carpool);
	Integer carpool_num();
	List<Carpool> listCarpool(RowBounds row, Search search);
	int deleteCarpool(Carpool carpool);
	Carpool detailCarpool(String c_num);
	int updateCarpool(Carpool carpool);
	int countCarpool(Search search);
	int insertCarpool_Request(Carpool_Request carpool_request);
	Integer carpool_Request_num();
	List<Carpool>myMakeCarpool(String u_id);
	List<Carpool_Request>myRequestCarpool(String u_id);
	int updatePerson(Carpool carpool);
}
