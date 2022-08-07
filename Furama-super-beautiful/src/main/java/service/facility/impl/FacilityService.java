package service.facility.impl;

import model.facility.Facility;
import repository.facility.IFacilityrepository;
import repository.facility.impl.FacilityRepository;
import service.facility.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityrepository facilityrepository = new FacilityRepository();
    @Override
    public List<Facility> FindAll() {
        return facilityrepository.FindAll();
    }

    @Override
    public boolean addFacility(Facility facility) {
        return facilityrepository.addFacility(facility);
    }

    @Override
    public boolean updateFacility(Facility facility) {
        return facilityrepository.updateFacility(facility);
    }

    @Override
    public boolean deleteFacility(int id) {
        return facilityrepository.deleteFacility(id);
    }

    @Override
    public Facility findById(int id) {
        return facilityrepository.findById(id);
    }
}
