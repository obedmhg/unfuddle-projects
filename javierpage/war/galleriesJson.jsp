<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
						com.ocorp.dao.GalleryUrlDao gd = new com.ocorp.dao.GalleryUrlDao();
						String jsonString = "{\"galleries\":[";
						
						for (com.ocorp.jdo.GalleryUrl gu : gd.getAllGalleryUrl()) {
							jsonString += "{\"password\":"
									+ "\"" + gu.getPassword() + "\",";
							jsonString += "\"url\":"
									+ "\"" + gu.getGalleryUrl() + "\"},";
						}
						jsonString = jsonString.substring(0, jsonString.length()-1);
						jsonString += "]}";
						out.append(jsonString);
					%>