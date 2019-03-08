package com.ocorp;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.click.Page;
import org.apache.click.control.Column;
import org.apache.click.control.Form;
import org.apache.click.control.Submit;
import org.apache.click.control.Table;
import org.apache.click.control.TextField;
import org.apache.click.util.Bindable;

public class ClickPage extends Page {
	private Form form = new Form("form");
	private String msg;
	private List aZoners;
    /**
     * Handle the form submit event.
     */
    public boolean onSubmit() {
        if (form.isValid()) {
            String name = form.getFieldValue("Name");
            this.aZoners = searchInFile(name);
        }
        return true;
    }
	@Bindable protected Table table = new Table();

    public ClickPage() {
        table.addColumn(new Column("Name"));
        table.addColumn(new Column("Phone"));
        table.addColumn(new Column("Possition"));
        table.addColumn(new Column("Reports"));
        addControl(form);

        form.add(new TextField("Name", true));
        form.add(new Submit("Search"));

        form.setListener(this, "onSubmit");
        String loginName = getContext().getRequest().getParameter("loginName");
        if (loginName!= null) {
        	addModel("loginName", loginName);
        }
    }

    /**
     * @see Page#onRender()
     */
    @Override
    public void onRender() {
        table.setRowList(this.aZoners);
    }

    public List<Person> searchInFile(String str){
		List<Person> list = new ArrayList<Person>();
		try{
		    FileInputStream fis = new FileInputStream("C:\\apps\\PersonalObjectiveProjects\\apacheClickExample\\WebContent\\phones.csv");
		    //FileInputStream fis = new FileInputStream("/home/omurillo/apache-tomcat-6.0.14/webapps/PhoneBook2.0/phones.csv");
		    // Get the object of DataInputStream
		    DataInputStream in = new DataInputStream(fis);
		    BufferedReader br = new BufferedReader(new InputStreamReader(in));

		    String strLine;
		    while ((strLine = br.readLine()) != null)   {
		    	String [] sp = strLine.split(",");
		    	if(str.contains(" ")){
		    		if(sp[0].equals(str.split(" ")[0].toUpperCase()) && sp[1].equals(str.split(" ")[1].toUpperCase())){
		    			list.clear();
		    			Person az = new Person();
				    	  az.setName(sp[0] + " " + sp[1]);
				    	  az.setPhone(sp[2]);
				    	  az.setPossition(sp[3]);
				    	  az.setReports(sp[4]);
				    	  list.add(az);
				    	 break;
		    		}
		    	}
		    	String shortForm =  sp[0].substring(0,1) + sp[1];
		    	if(shortForm.startsWith(str.toUpperCase())){
		    		Person az = new Person();
			    	  az.setName(sp[0] + " " + sp[1]);
			    	  az.setPhone(sp[2]);
			    	  az.setPossition(sp[3]);
			    	  az.setReports(sp[4]);
			    	  list.add(az);
		    	}
		      if(strLine.contains(str.toUpperCase())){

		    	  Person az = new Person();
		    	  az.setName(sp[0] + " " + sp[1]);
		    	  az.setPhone(sp[2]);
		    	  az.setPossition(sp[3]);
		    	  az.setReports(sp[4]);
		    	  list.add(az);
		      }
		    }
		    //Close the input stream
		    in.close();
		    }catch (Exception e){//Catch exception if any
		      System.err.println("Error: " + e.getMessage());
		    }
		    return list;
	}

    public class Person{
    	private String name;
    	private String phone;
    	private String possition;
    	private String reports;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPhone() {
			return phone;
		}
		public String getReports() {
			return reports;
		}
		public void setReports(String reports) {
			this.reports = reports;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getPossition() {
			return possition;
		}
		public void setPossition(String possition) {
			this.possition = possition;
		}
    }
}
