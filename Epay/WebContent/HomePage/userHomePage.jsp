<%@page import="java.util.ArrayList"%>
<%@page import="dbObjects.User"%>
<%@page import="dbObjects.Paycheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
       uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home page</title>
    <link type="text/css" rel="stylesheet" href="../jQuery/jquery-ui.min.css"></link>
    	
	<script type="text/javascript" src="../jQuery/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="../jQuery/jquery-ui.min.js"></script>
	<script type="text/javascript" src="HomePage.js"></script>

</head>
<body>
	
	<div class="content">
	    User <c:out value="${user.fullName}"></c:out>
	    <br/>
	    Select your account:
	    <form id="dropdownform" action="../LoginToHomeServlet" method="post">
	    <select id="dropdown" name="dropdown">
	      	<c:forEach var="entry" items="${accounts}">
  				<option value="${entry.key}">${entry.value}</option>
			</c:forEach>
	    </select>
	    </form>
	    <div id="tabs">
  			<ul>
   			    <li><a href="#tabs-1">Overview</a></li>
    			<li><a href="#tabs-2">New Paycheck</a></li>
    			<li><a href="#tabs-3">New Invoice</a></li>
  			</ul>
  		<div id="tabs-1">
  		   <ul id="listBills">
  		     <c:forEach items="${sentPaychecks}" var="entry">
				<li value=${entry.idPaycheck} type="sentP">-&gt${entry.description}</li>		
				</c:forEach>
			 <c:forEach items="${receivedPaychecks}" var="entry">
				<li value=${entry.idPaycheck} type="receivedP">&lt-${entry.description}</li>		
				</c:forEach>
  		   </ul>
        </div>
       	<div id="tabs-2">
      	</div>
        <div id="tabs-3">
        </div>
	    </div>
	</div>
</body>
</html>