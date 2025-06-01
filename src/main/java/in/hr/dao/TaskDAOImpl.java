package in.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import in.hr.connection.Connector;
import in.hr.dto.Task;

public class TaskDAOImpl implements TaskDAO {
private Connection con;

public TaskDAOImpl() {
	this.con=Connector.requestConnection();	
}
	@Override
	public boolean insertTask(Task t) {
		
		return false;
	}

	@Override
	public boolean updateTask(Task t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteTask(Task t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Task getTask(int taskId, int eid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Task getTask(int taskId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Task> getTByEmployee(int eid) {
		// TODO Auto-generated method stub
		return null;
	}

}
