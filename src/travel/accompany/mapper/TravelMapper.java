package travel.accompany.mapper;

import java.util.List;

import travel.accompany.model.Accompany;
import travel.accompany.model.Route;

public interface TravelMapper {

	List<Accompany> getUserRoute(Route route);
	List<Accompany> getUserInfo(String ID);
	List<Accompany> getAccompanies(Accompany accompany);


}
