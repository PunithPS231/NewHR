package in.hr.dao;

import java.util.ArrayList;

import in.hr.dto.Task;

public interface TaskDAO {
	public boolean insertTask(Task t);
	public boolean updateTask(Task t);
	public boolean deleteTask(Task t);
	public Task getTask(int taskId, int eid);
	public Task getTask(int taskId);
	public ArrayList<Task> getTByEmployee(int eid);	
}
