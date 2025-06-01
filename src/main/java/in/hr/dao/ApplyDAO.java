package in.hr.dao;

import java.util.ArrayList;

import in.hr.dto.Apply;

public interface ApplyDAO {
	public boolean insertLeave(Apply a);
	public boolean updateLeave(Apply a);
	public boolean deleteLeave(Apply a);
	public Apply getClSlByEmp(int eid);
	public Apply getLeave(int leaveId);
	public ArrayList<Apply> getLeaveByEmployee(int eid);
	public ArrayList<Apply> getLeave();
	public int dateCheck(String date);
	public ArrayList<Apply> resignByEmployee();
}
