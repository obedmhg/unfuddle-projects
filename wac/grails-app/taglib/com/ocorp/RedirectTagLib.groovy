package com.ocorp

class RedirectTagLib {

	def redirectMainPage = {
		response.sendRedirect("${request.contextPath}/menu/list")
	  }
	
}
