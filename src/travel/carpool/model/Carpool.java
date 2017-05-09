package travel.carpool.model;

import java.io.Serializable;

public class Carpool implements Serializable {

	private int c_num;
	private String u_id;
	private String start_lati;
	private String start_longti;
	private String dest_lati;
	private String dest_longti;
	private String c_price;
	private String c_date;
	private int c_person;
	private String c_dept_time;
	
	
	public Carpool(){}


	public Carpool(int c_num, String u_id, String start_lati, String start_longti, String dest_lati,
			String dest_longti, String c_price, String c_date, int c_person, String c_dept_time) {
		super();
		this.c_num = c_num;
		this.u_id = u_id;
		this.start_lati = start_lati;
		this.start_longti = start_longti;
		this.dest_lati = dest_lati;
		this.dest_longti = dest_longti;
		this.c_price = c_price;
		this.c_date = c_date;
		this.c_person = c_person;
		this.c_dept_time = c_dept_time;
	}


	public int getC_num() {
		return c_num;
	}


	public void setC_num(int c_num) {
		this.c_num = c_num;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public String getStart_lati() {
		return start_lati;
	}


	public void setStart_lati(String start_lati) {
		this.start_lati = start_lati;
	}


	public String getStart_longti() {
		return start_longti;
	}


	public void setStart_longti(String start_longti) {
		this.start_longti = start_longti;
	}


	public String getDest_lati() {
		return dest_lati;
	}


	public void setDest_lati(String dest_lati) {
		this.dest_lati = dest_lati;
	}


	public String getDest_longti() {
		return dest_longti;
	}


	public void setDest_longti(String dest_longti) {
		this.dest_longti = dest_longti;
	}


	public String getC_price() {
		return c_price;
	}


	public void setC_price(String c_price) {
		this.c_price = c_price;
	}


	public String getC_date() {
		return c_date;
	}


	public void setC_date(String c_date) {
		this.c_date = c_date;
	}


	public int getC_person() {
		return c_person;
	}


	public void setC_person(int c_person) {
		this.c_person = c_person;
	}


	public String getC_dept_time() {
		return c_dept_time;
	}


	public void setC_dept_time(String c_dept_time) {
		this.c_dept_time = c_dept_time;
	}
	
}
