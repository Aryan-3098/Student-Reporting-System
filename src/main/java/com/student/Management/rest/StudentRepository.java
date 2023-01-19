package com.student.Management.rest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Query;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.student.Management.pojo.Student;

@Service
public interface StudentRepository extends ElasticsearchRepository<Student, String> {
	Page<Student> findByRollNumber(Integer Id, Pageable pageable);

	@Query("{\"bool\": {\"must\": [{\"match\": {\"name\": \"?0\"}}]}}")
	Page<Student> findByNameUsingCustomQuery(String name, Pageable pageable);
}
