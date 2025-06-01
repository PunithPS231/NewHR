package in.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.hr.connection.Connector;
import in.hr.dto.Tickets;

public class TicketsDAOImpl implements TicketsDAO {
private Connection con;

public TicketsDAOImpl() {
	this.con=Connector.requestConnection();
}
	@Override
	public boolean insertTicket(Tickets t) {
		String query="INSERT INTO TICKET VALUES (?,?,?,?,'Open',SYSDATE(),SYSDATE())";
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, t.getId());
			ps.setInt(2, t.getEid());
			ps.setString(3,t.getSubject());
			ps.setString(4, t.getAbout());
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
	public boolean updateTicket(Tickets t) {
		String query="UPDATE TICKET SET SUBJECT=?,ABOUT=?,STATUS=?,RESOLVED_DATE=SYSDATE() WHERE ID=?";
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, t.getSubject());
			ps.setString(2,t.getAbout());
			ps.setString(3, t.getStatus());
			ps.setLong(4, t.getId());
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
	public boolean deleteTicket(Tickets t) {
		String query="DELETE FROM TICKET WHERE ID=?";
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, t.getId());
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
	public Tickets getTicket(long ticketId) {
		String query="SELECT * FROM TICKET WHERE ID=?";
		//ArrayList<Tickets> tickets=new ArrayList<>();
		Tickets t=null;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1,ticketId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				t=new Tickets();
				t.setId(rs.getLong("id"));
				t.setEid(rs.getInt("eid"));
				t.setSubject(rs.getString("subject"));
				t.setAbout(rs.getString("about"));
				t.setStatus(rs.getString("status"));
				t.setResolved_date(rs.getString("resolved_date"));
				t.setDate(rs.getString("date"));
			//	tickets.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return t;
	}

	/*
	 * @Override public Tickets getTicket(long ticketId, int eid) { // TODO
	 * Auto-generated method stub return null; }
	 */

	@Override
	public ArrayList<Tickets> getTicketsByEmployee(int eid) {
		String query="SELECT * FROM TICKET WHERE EID=?";
		ArrayList<Tickets> tickets=new ArrayList<>();
		Tickets t=null;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, eid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				t=new Tickets();
				t.setId(rs.getLong("id"));
				t.setEid(rs.getInt("eid"));
				t.setSubject(rs.getString("subject"));
				t.setAbout(rs.getString("about"));
				t.setStatus(rs.getString("status"));
				t.setResolved_date(rs.getString("resolved_date"));
				t.setDate(rs.getString("date"));
				tickets.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tickets;
	}
	@Override
	public ArrayList<Tickets> getTicket() {
		String query="SELECT * FROM TICKET ORDER BY DATE DESC";
		ArrayList<Tickets> tickets=new ArrayList<>();
		Tickets t=null;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				t=new Tickets();
				t.setId(rs.getLong("id"));
				t.setEid(rs.getInt("eid"));
				t.setSubject(rs.getString("subject"));
				t.setAbout(rs.getString("about"));
				t.setStatus(rs.getString("status"));
				t.setResolved_date(rs.getString("resolved_date"));
				t.setDate(rs.getString("date"));
				tickets.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tickets;
	}

}
