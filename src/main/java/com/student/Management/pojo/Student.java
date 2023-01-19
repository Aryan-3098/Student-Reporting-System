package com.student.Management.pojo;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;

@Document(indexName = "students_records")
public class Student {
	@Id
	String id;
	Integer rollNumber;
	String name;
	Float engM;
	Float mathsM;
	Float sciM;
	Integer sem;

	public Integer getRollNumber() {
		return rollNumber;
	}

	public void setRollNumber(Integer rollNumber) {
		this.rollNumber = rollNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getEngM() {
		return engM;
	}

	public void setEngM(Float engM) {
		this.engM = engM;
	}

	public Float getMathsM() {
		return mathsM;
	}

	public void setMathsM(Float mathsM) {
		this.mathsM = mathsM;
	}

	public Float getSciM() {
		return sciM;
	}

	public void setSciM(Float sciM) {
		this.sciM = sciM;
	}

	public Integer getSem() {
		return sem;
	}

	public void setSem(Integer sem) {
		this.sem = sem;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", rollNumber=" + rollNumber + ", name=" + name + ", engM=" + engM + ", mathsM="
				+ mathsM + ", sciM=" + sciM + ", sem=" + sem + "]";
	}
	
}
