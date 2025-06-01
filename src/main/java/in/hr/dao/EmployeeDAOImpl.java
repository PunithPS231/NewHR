package in.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.hr.connection.Connector;
import in.hr.dto.Employee;

public class EmployeeDAOImpl implements EmployeeDAO {
private Connection con;
	
	public EmployeeDAOImpl() {
		this.con=Connector.requestConnection();
	}
	
	@Override
	public boolean insertEmployee(Employee e) {
		String query="INSERT INTO EMPLOYEE VALUES (0,?,?,?,?,?,?,?,?,?,SYSDATE(),?,?)";
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1,e.getName());
			ps.setLong(2,e.getPhone());
			ps.setString(3, e.getMail());
			ps.setString(4,e.getJob());
			ps.setString(5, e.getDob());
			ps.setDouble(6, e.getSal());
			ps.setString(7, e.getDoj());
			ps.setString(8, e.getPassword());
			ps.setString(9, e.getStatus());
			ps.setInt(10,e.getSl());
			ps.setInt(11, e.getCl());
			i=ps.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
		return false;
		}
	}

	@Override
	public boolean updateEmployee(Employee e) {
		String query="UPDATE EMPLOYEE SET NAME=?,PHONE=?,MAIL=?,JOB=?,DOB=?,sal=?,DOJ=?,PASSWORD=?,STATUS=?,DATE=SYSDATE(),SL=?,CL=? WHERE ID=?";
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1,e.getName());
			ps.setLong(2,e.getPhone());
			ps.setString(3, e.getMail());
			ps.setString(4,e.getJob());
			ps.setString(5, e.getDob());
			ps.setDouble(6, e.getSal());
			ps.setString(7, e.getDoj());
			ps.setString(8, e.getPassword());
			ps.setString(9, e.getStatus());
			ps.setInt(10, e.getSl());
			ps.setInt(11,e.getCl());
			ps.setInt(12, e.getEid());
			i=ps.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
		return false;
		}
	}

	@Override
	public boolean deleteEmployee(Employee e) {
		String query="DELETE FROM EMPLOYEE WHERE ID=?";
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, e.getEid());
			i=ps.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
		return false;
		}
	}

	@Override
	public Employee getEmployee(String mail, String password) {
		Employee emp=null;
		String query="SELECT * FROM EMPLOYEE WHERE MAIL=? AND PASSWORD=?";
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				emp=new Employee();
				emp.setEid(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setPhone(rs.getLong("phone"));
				emp.setMail(rs.getString("mail"));
				emp.setJob(rs.getString("job"));
				emp.setDob(rs.getString("dob"));
				emp.setSal(rs.getDouble("sal"));
				emp.setDoj(rs.getString("doj"));
				emp.setPassword(rs.getString("password"));
				emp.setStatus(rs.getString("status"));
				emp.setDate(rs.getString("date"));
				emp.setSl(rs.getInt("sl"));
				emp.setCl(rs.getInt("cl"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return emp;
	}

	@Override
	public ArrayList<Employee> getEmployee() {
		ArrayList<Employee> employees=new ArrayList<Employee>();
		Employee emp=null;
		String query="SELECT * FROM EMPLOYEE where status ='active'";
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				emp=new Employee();
				emp.setEid(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setPhone(rs.getLong("phone"));
				emp.setMail(rs.getString("mail"));
				emp.setJob(rs.getString("job"));
				emp.setDob(rs.getString("dob"));
				emp.setSal(rs.getDouble("sal"));
				emp.setDoj(rs.getString("doj"));
				emp.setPassword(rs.getString("password"));
				emp.setStatus(rs.getString("status"));
				emp.setDate(rs.getString("date"));
				emp.setSl(rs.getInt("sl"));
				emp.setCl(rs.getInt("cl"));
				employees.add(emp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return employees;
	}

	@Override
	public Employee getEmployee(int id) {
		Employee emp=null;
		String query="SELECT * FROM EMPLOYEE WHERE ID=?";
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				emp=new Employee();
				emp.setEid(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setPhone(rs.getLong("phone"));
				emp.setMail(rs.getString("mail"));
				emp.setJob(rs.getString("job"));
				emp.setDob(rs.getString("dob"));
				emp.setSal(rs.getDouble("sal"));
				emp.setDoj(rs.getString("doj"));
				emp.setPassword(rs.getString("password"));
				emp.setStatus(rs.getString("status"));
				emp.setDate(rs.getString("date"));
				emp.setSl(rs.getInt("sl"));
				emp.setCl(rs.getInt("cl"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return emp;
	}

	@Override
	public Employee getEmployee(long phone, String mail) {
		Employee emp=null;
		String query="SELECT * FROM EMPLOYEE WHERE PHONE=? AND MAIL=?";
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, mail);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				emp=new Employee();
				emp.setEid(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setPhone(rs.getLong("phone"));
				emp.setMail(rs.getString("mail"));
				emp.setJob(rs.getString("job"));
				emp.setDob(rs.getString("dob"));
				emp.setSal(rs.getDouble("sal"));
				emp.setDoj(rs.getString("doj"));
				emp.setPassword(rs.getString("password"));
				emp.setStatus(rs.getString("status"));
				emp.setDate(rs.getString("date"));
				emp.setSl(rs.getInt("sl"));
				emp.setCl(rs.getInt("cl"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return emp;
	}

	
}
