package VO;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Department", uniqueConstraints = @UniqueConstraint(name = "unique", columnNames = "DepartmentCode"))
public class DepartmentVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "DepartmentName")
	private String department;
	
	@Column(name = "DepartmentCode")
	private int departmentcode;
	
	@ManyToOne
	@JoinColumn(name="DepartmentCollegeid")
	private CollegeVo departmentcollegeid;
	
	@OneToMany(mappedBy = "departmentid")
	private List<StudentVo> studentid;
	
	@OneToMany(mappedBy = "departmentid")
	private List<SemVo> semid ;
	
	@OneToMany(mappedBy = "departmentid")
	private List<SubjectVo> departmentid;
	
	@OneToMany( mappedBy = "departmentid")
	private List<DepartmentProfessorVo> departmentprofessor;
	
	@OneToMany( mappedBy = "departmentid")
	private List<ProfessorVo> professorid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getDepartmentcode() {
		return departmentcode;
	}

	public void setDepartmentcode(int departmentcode) {
		this.departmentcode = departmentcode;
	}

	public CollegeVo getDepartmentcollegeid() {
		return departmentcollegeid;
	}

	public void setDepartmentcollegeid(CollegeVo departmentcollegeid) {
		this.departmentcollegeid = departmentcollegeid;
	}

	public List<StudentVo> getStudentid() {
		return studentid;
	}

	public void setStudentid(List<StudentVo> studentid) {
		this.studentid = studentid;
	}

	public List<SemVo> getSemid() {
		return semid;
	}

	public void setSemid(List<SemVo> semid) {
		this.semid = semid;
	}

	public List<SubjectVo> getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(List<SubjectVo> departmentid) {
		this.departmentid = departmentid;
	}

	public List<DepartmentProfessorVo> getDepartmentprofessor() {
		return departmentprofessor;
	}

	public void setDepartmentprofessor(List<DepartmentProfessorVo> departmentprofessor) {
		this.departmentprofessor = departmentprofessor;
	}
	
}
