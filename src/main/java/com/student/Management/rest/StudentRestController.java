package com.student.Management.rest;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.student.Management.pojo.Student;

@RestController
public class StudentRestController {

	@Autowired
	StudentRepository repo;

	@GetMapping(path = "/hello", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> sayHello() {
		return new ResponseEntity<Object>("hello", HttpStatus.OK);
	}

	@PostMapping(path = "/addStudent")
	public ResponseEntity<Object> addStudent(@RequestBody Student ss) {
		ss.setId(UUID.randomUUID().toString());
		System.err.println(ss);
		repo.save(ss);
		return new ResponseEntity<Object>(ss, HttpStatus.OK);
	}

	@GetMapping(path = "/findById/{Id}")
	public ResponseEntity<Object> findById(@PathVariable Integer Id) {
		Optional<Student> findById = repo.findById(Id + "");
		return new ResponseEntity<Object>(findById, HttpStatus.OK);
	}

	@GetMapping(path = "/findByName/{name}")
	public ResponseEntity<Object> findByName(@PathVariable String name) {
		Page<Student> findById = repo.findByNameUsingCustomQuery(name, null);
		return new ResponseEntity<Object>(findById, HttpStatus.OK);
	}

	@GetMapping(path = "/percentage/{sem}")
	public ResponseEntity<Object> fetchPercentage(@PathVariable Integer sem) {
		Iterable<Student> findAll = repo.findAll();
		Float totalMarks = 0f;
		int totalEntries = 0;
		Map<String, Object> response = new HashMap<>();
		for (Student student : findAll) {
			if (student.getSem() == sem) {
				totalEntries++;
				totalMarks += student.getEngM() != null ? student.getEngM() : 0;
				totalMarks += student.getMathsM() != null ? student.getMathsM() : 0;
				totalMarks += student.getSciM() != null ? student.getSciM() : 0;
			}
		}
		Double per = (totalMarks / (totalEntries * 3d));
		response.put("percentage", per);
		return new ResponseEntity<Object>(response, HttpStatus.OK);
	}

	@GetMapping(path = "/average/{sub}")
	public ResponseEntity<Object> fetchSubAvg(@PathVariable String sub) {
		Iterable<Student> findAll = repo.findAll();
		Float totalMarks = 0f;
		Float subMarks = 0f;
		int totalEntries = 0;
		Map<String, Object> response = new HashMap<>();
		for (Student student : findAll) {
			if (sub.equalsIgnoreCase("English")) {
				subMarks += student.getEngM() != null ? student.getEngM() : 0;
			} else if (sub.equalsIgnoreCase("Mathematics")) {
				subMarks += student.getMathsM() != null ? student.getMathsM() : 0;

			} else if (sub.equalsIgnoreCase("Science")) {
				subMarks += student.getSciM() != null ? student.getSciM() : 0;
			}
			totalMarks += student.getEngM() != null ? student.getEngM() : 0;
			totalMarks += student.getMathsM() != null ? student.getMathsM() : 0;
			totalMarks += student.getSciM() != null ? student.getSciM() : 0;
			totalEntries++;
		}

		response.put("percentage", (totalMarks / (totalEntries * 3f)));
		response.put("average", (subMarks / (totalEntries)));
		return new ResponseEntity<Object>(response, HttpStatus.OK);
	}
	
	
	@GetMapping(path = "/topScorer")
	public ResponseEntity<Object> topScorer() {
		Iterable<Student> findAll = repo.findAll();
		Map<String, Object> response = new HashMap<>();
		TreeMap<Float, String> topTwoScorer = new TreeMap<>(Collections.reverseOrder());
		Map<String, Map<String, Float>> userWise = new HashMap<>();
		for (Student student : findAll) {
			if(!userWise.containsKey(student.getName())) {
				Map<String, Float> marks =new HashMap<>();
				marks.put("English", student.getEngM());
				marks.put("Mathematics", student.getMathsM());
				marks.put("Science", student.getSciM());
				userWise.put(student.getName(), marks);
			}else {
				Map<String, Float> def = userWise.get(student.getName());
				def.put("English", (def.get("English") + student.getEngM()) / 2f);
				def.put("Mathematics", (def.get("Mathematics") +student.getMathsM())/2f);
				def.put("Science", (def.get("Science") +student.getSciM())/2f);
				userWise.put(student.getName(), def);
			}
			
		}
		for (String studentKey : userWise.keySet()) {
			Map<String, Float> map = userWise.get(studentKey);
			Float avg =0f;
			for (Float marks : map.values()) {
				avg +=marks;
			}
			avg /=3f;
			topTwoScorer.put(avg, studentKey);
		}
		response.put("userWiseAverage", userWise);
		response.put("topTwoScorer", topTwoScorer);
		return new ResponseEntity<Object>(response, HttpStatus.OK);
	}
}
