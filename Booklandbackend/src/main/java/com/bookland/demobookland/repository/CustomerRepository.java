package com.bookland.demobookland.repository;


import com.bookland.demobookland.model.Customer;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends CrudRepository<Customer,Integer> {

   Customer findByEmail(String email);

}
