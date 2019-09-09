package kr.co.kic.dev1.dto;

public class EmpDto {
	private int no;
	private String name;
	private String job;
	private int mgr;
	private String hiredate;
	private float sal;
	private float comm;
	private int deptNo;
	public EmpDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmpDto(int no, String name, String job, int mgr, String hiredate, float sal, float comm, int deptNo) {
		super();
		this.no = no;
		this.name = name;
		this.job = job;
		this.mgr = mgr;
		this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.deptNo = deptNo;
	}
	public EmpDto(int empno, String name, String job, int mgr, String hiredate,int deptno) {
		this(empno, name,job,mgr,hiredate,0,0,deptno);
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getMgr() {
		return mgr;
	}
	public void setMgr(int mgr) {
		this.mgr = mgr;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public float getSal() {
		return sal;
	}
	public void setSal(float sal) {
		this.sal = sal;
	}
	public float getComm() {
		return comm;
	}
	public void setComm(float comm) {
		this.comm = comm;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	
}
