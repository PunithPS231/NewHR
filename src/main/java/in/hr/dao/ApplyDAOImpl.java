package in.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.hr.connection.Connector;
import in.hr.dto.Apply;

public class ApplyDAOImpl implements ApplyDAO {
private Connection con;
	
	public ApplyDAOImpl() {
		this.con=Connector.requestConnection();
	}
	@Override
	public boolean insertLeave(Apply a) {
		String query="INSERT INTO APPLY VALUES (0,?,?,?,?,?,'Pending',sysdate())";
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, a.getEid());
			ps.setString(2, a.getType());
			ps.setString(3, a.getStart_date());
			ps.setString(4, a.getEnd_date());
			ps.setString(5, a.getReason());
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
	public boolean updateLeave(Apply a) {
		String query="UPDATE APPLY SET START_DATE=?,END_DATE=?,STATUS=? WHERE ID=?";
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, a.getStart_date());
			ps.setString(2, a.getEnd_date());
			ps.setString(3, a.getStatus());
			ps.setInt(4, a.getId());
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
	public boolean deleteLeave(Apply a) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Apply> getLeaveByEmployee(int eid) {
		String query="SELECT * FROM APPLY WHERE EID=?";
		ArrayList<Apply> leaveList=new ArrayList<>();
		Apply a=null;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, eid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new Apply();
				a.setId(rs.getInt("id"));
				a.setEid(rs.getInt("eid"));
				a.setType(rs.getString("type"));
				a.setReason(rs.getString("reason"));
				a.setStart_date(rs.getString("start_date"));
				a.setEnd_date(rs.getString("end_date"));
				a.setStatus(rs.getString("status"));
				a.setDate(rs.getString("date"));
				leaveList.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return leaveList;
	}
		
	@Override
	public int dateCheck(String date) {
		String query="SELECT DATEDIFF(?,SYSDATE()) VALUE";
		PreparedStatement ps=null;
		int value=0;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1,date);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				value=rs.getInt("VALUE");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return value;
	}
	@Override
	public Apply getLeave(int leaveId) {
		String query="SELECT * FROM APPLY WHERE ID=?";
		ArrayList<Apply> leaveList=new ArrayList<>();
		Apply a=null;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1,leaveId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new Apply();
				a.setId(rs.getInt("id"));
				a.setEid(rs.getInt("eid"));
				a.setType(rs.getString("type"));
				a.setReason(rs.getString("reason"));
				a.setStart_date(rs.getString("start_date"));
				a.setEnd_date(rs.getString("end_date"));
				a.setStatus(rs.getString("status"));
				a.setDate(rs.getString("date"));
				//leaveList.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}
	@Override
	public ArrayList<Apply> getLeave() {
		String query="SELECT * FROM APPLY WHERE STATUS='Pending' AND TYPE IN ('Casual Leave','Sick Leave')";
		ArrayList<Apply> leaveList=new ArrayList<>();
		Apply a=null;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new Apply();
				a.setId(rs.getInt("id"));
				a.setEid(rs.getInt("eid"));
				a.setType(rs.getString("type"));
				a.setReason(rs.getString("reason"));
				a.setStart_date(rs.getString("start_date"));
				a.setEnd_date(rs.getString("end_date"));
				a.setStatus(rs.getString("status"));
				a.setDate(rs.getString("date"));
				leaveList.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return leaveList;
	}
	@Override
	public ArrayList<Apply> resignByEmployee() {
		String query="SELECT * FROM APPLY WHERE STATUS='Pending' AND TYPE='Resign'";
		ArrayList<Apply> leaveList=new ArrayList<>();
		Apply a=null;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new Apply();
				a.setId(rs.getInt("id"));
				a.setEid(rs.getInt("eid"));
				a.setType(rs.getString("type"));
				a.setReason(rs.getString("reason"));
				a.setStart_date(rs.getString("start_date"));
				a.setEnd_date(rs.getString("end_date"));
				a.setStatus(rs.getString("status"));
				a.setDate(rs.getString("date"));
				leaveList.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return leaveList;
	}
	@Override
	public Apply getClSlByEmp(int eid) {
		String query="SELECT * FROM APPLY WHERE EID=? ORDER BY DATE DESC LIMIT 1";
		ArrayList<Apply> leaveList=new ArrayList<>();
		Apply a=null;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1,eid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new Apply();
				a.setId(rs.getInt("id"));
				a.setEid(rs.getInt("eid"));
				a.setType(rs.getString("type"));
				a.setReason(rs.getString("reason"));
				a.setStart_date(rs.getString("start_date"));
				a.setEnd_date(rs.getString("end_date"));
				a.setStatus(rs.getString("status"));
				a.setDate(rs.getString("date"));
				
				//leaveList.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

}
