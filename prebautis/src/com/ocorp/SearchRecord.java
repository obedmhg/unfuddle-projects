package com.ocorp;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import com.ocorp.jdo.Registro;

@SuppressWarnings("serial")
public class SearchRecord extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String field = req.getParameter("field");
		FileInputStream fstream = new FileInputStream("pre.csv");
		BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
		List<Registro> searchResults = new ArrayList<Registro>();
		String strLine;
		while ((strLine = br.readLine()) != null)   {
		  if (strLine.contains(field.toUpperCase())) {
			  String [] regSplit = strLine.split(",");
			  Registro reg = new Registro();
			  reg.setParroquia("Señor de la Misericordia");
			  reg.setFecha(getMes(new Integer(regSplit[0].split("/")[1])) + "-" + regSplit[0].split("/")[2]) ;
			  if (regSplit[1].equals("")) {
				  reg.setFolio("N/A");  
			  }else {
				  reg.setFolio(regSplit[1]);
			  }
			  reg.setNombre(regSplit[2]);
			  reg.setEstadoCivil(regSplit[3]);
			  if (regSplit[4].equalsIgnoreCase("x")) {
				  reg.setParentesco("Papá/Mamá");
			  } else {
				  reg.setParentesco("Padrino/Madrina");
			  }
			  if (regSplit[6].equalsIgnoreCase("2")) {
				  reg.setTipo("Unica Ocacion");
			  } else {
				  if (regSplit[1].equals("")) {
					  reg.setTipo("Por 2 años");
				  } else {
					  reg.setTipo("Por 5 años");
				  }
			  }
			  searchResults.add(reg);
		  }
		}
		br.close();
		resp.sendRedirect("/searchResults.jsp");
		req.getSession().setAttribute("count", searchResults.size());
		req.getSession().setAttribute("busqueda", field);
		req.getSession().setAttribute("results", searchResults);
	}
	
	private String getMes(int n) {
		String mes = "";
		switch (n) {
			case 1: mes = "Ene";
			case 2: mes = "Feb";
			case 3: mes = "Mar";
			case 4: mes = "Abr";
			case 5: mes = "May";
			case 6: mes = "Jun";
			case 7: mes = "Jul";
			case 8: mes = "Ago";
			case 9: mes = "Sep";
			case 10: mes = "Oct";
			case 11: mes = "Nov";
			case 12: mes = "Dic";	
		}
		return mes;
	}

	
}
