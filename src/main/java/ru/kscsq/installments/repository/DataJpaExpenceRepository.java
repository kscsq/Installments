package ru.kscsq.installments.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.kscsq.installments.model.Expence;

import java.util.List;

@Repository
public class DataJpaExpenceRepository implements ExpenceRepository {

    @Autowired
    private CrudExpenceRepository expenceRepository;

    @Override
    public List<Expence> getAll() {
        return expenceRepository.findAll();
    }

    @Override
    public void save(Expence expence) {
        expenceRepository.save(expence);
    }

    @Override
    public void delete(Integer id) {
        expenceRepository.deleteById(id);
    }

    @Override
    public Expence getOne(Integer id) {
        return expenceRepository.getOne(id);
    }
}
