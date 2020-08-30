package VO;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "Professsor", uniqueConstraints = @UniqueConstraint(name = "unique", columnNames = "Email"))
public class ProfessorVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "FirstName")
	private String firstName;

	@Column(name = "LastName")
	private String lastName;

	@Column(name = "Email")
	private String email;

	@Column(name = "Password")
	private String password;

	@Column(name = "Contact_NO")
	private String con_no;

	@Column(name = "Address")
	private String address;

	@Column(name = "Gender")
	private String gender;

	@Column(name = "Salary")
	private String salary;

	@Column(name = "Roll")
	private String roll;

	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@ManyToOne
	@JoinColumn(name = "Collegeid")
	private CollegeVo collegeid;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "profrssorid")
	private List<DepartmentProfessorVo> departmentprofessor;
	
	@OneToMany(mappedBy = "profrssorid")
	private List<SemProfessorVo> semprofessor;
	
	@OneToMany(mappedBy = "profrssorid")
	private List<SubjectProfessorVo> subjectprofessor;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCon_no() {
		return con_no;
	}

	public void setCon_no(String con_no) {
		this.con_no = con_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getRoll() {
		return roll;
	}

	public void setRoll(String roll) {
		this.roll = roll;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}

	public List<DepartmentProfessorVo> getDepartmentprofessor() {
		return departmentprofessor;
	}

	public void setDepartmentprofessor(List<DepartmentProfessorVo> departmentprofessor) {
		this.departmentprofessor = departmentprofessor;
	}

	public List<SemProfessorVo> getSemprofessor() {
		return semprofessor;
	}

	public void setSemprofessor(List<SemProfessorVo> semprofessor) {
		this.semprofessor = semprofessor;
	}

	public List<SubjectProfessorVo> getSubjectprofessor() {
		return subjectprofessor;
	}

	public void setSubjectprofessor(List<SubjectProfessorVo> subjectprofessor) {
		this.subjectprofessor = subjectprofessor;
	}

	public CollegeVo getCollegeid() {
		return collegeid;
	}

	public void setCollegeid(CollegeVo collegeid) {
		this.collegeid = collegeid;
	}

}
