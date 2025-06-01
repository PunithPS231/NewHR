package in.hr.index;

import java.util.Random;

public class RandomNumber {
	public static long randomNumberGenerator() {
		Random rd=new Random();
		int num = 0; 
		long ans = 0; 
		long val=rd.nextLong();//-123456789876543234
		if(val<0) {
			val=val*-1;
		}
		while(num<15) {
			long rem=val%10;
			ans=(ans*10)+rem;
			val=val/10;
			num+=1;
		}
		//System.out.println(ans);
		return ans;
	}
}
