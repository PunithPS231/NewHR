package in.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.hr.connection.Connector;
import in.hr.dto.Salary;

public class SalaryDAOImpl implements SalaryDAO{
private Connection con;

	public SalaryDAOImpl() {
		this.con=Connector.requestConnection();
	}
	@Override
	public boolean insertSalary(Salary s) {
		String query="INSERT INTO SALARY VALUES (?,?,?,?,?,?,sysdate())";
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, s.getId());
			ps.setInt(2, s.getEid());
			ps.setString(3, s.getMonth_year());
			ps.setDouble(4, s.getSal());
			ps.setDouble(5, s.getNetPay());
			ps.setString(6, s.getUrl());
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean updateSalary(Salary s) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteSalary(Salary s) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Salary getSalary(int eid,String month) {
		String query="SELECT * FROM SALARY WHERE EID=? AND MONTH_YEAR=?";
		PreparedStatement ps=null;
		Salary s=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, eid);
			ps.setString(2, month);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new Salary();
				s.setId(rs.getLong("id"));
				s.setEid(rs.getInt("eid"));
				s.setMonth_year(rs.getString("month_year"));
				s.setSal(rs.getDouble("sal"));
				s.setNetPay(rs.getDouble("net"));
				s.setUrl(rs.getString("url"));
				s.setDate(rs.getString("date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public Salary getSalary(long TransactionId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Salary> getSalaryByEmployee(int eid) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getDate(String date) {
		String query="SELECT DATE_FORMAT(STR_TO_DATE(?,'%d %M %Y'),'%Y-%m') MONTH";
		PreparedStatement ps=null;
		String month=null;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, date);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				month=rs.getString("month");
				System.out.println(month);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return month;
	}
	@Override
	public ArrayList<Salary> getSalary() {
		ArrayList<Salary> salList=new ArrayList<Salary>();
		String query="SELECT * FROM SALARY";
		PreparedStatement ps=null;
		Salary s=null;
		try {
			ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new Salary();
				s.setId(rs.getLong("id"));
				s.setEid(rs.getInt("eid"));
				s.setMonth_year(rs.getString("month_year"));
				s.setSal(rs.getDouble("sal"));
				s.setNetPay(rs.getDouble("net"));
				s.setUrl(rs.getString("url"));
				s.setDate(rs.getString("date"));
				salList.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return salList;
	}
	

}
