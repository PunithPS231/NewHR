package in.hr.dto;

public class Employee {
	private int eid;
	private String name;
	private long phone;
	private String mail;
	private String dob;
	private double sal;
	private String doj;
	private String job;
	private String password;
	private String status;
	private String date;
	private int sl;
	private int cl;
	
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	public int getCl() {
		return cl;
	}
	public void setCl(int cl) {
		this.cl = cl;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
		}
	@Override
	public String toString() {
		return "Employee [eid=" + eid + ", name=" + name + ", phone=" + phone + ", mail=" + mail + ", dob=" + dob
				+ ", doj=" + doj + ", job=" + job + ", sal=" + sal + " , status=" + status + "]";
	}	
	
}
