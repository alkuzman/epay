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
    <link type="text/css" rel="stylesheet" href="jQuery/jquery-ui.min.css"></link>
    	
	<script type="text/javascript" src="jQuery/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="jQuery/jquery-ui.min.js"></script>
	<script type="text/javascript" src="HomePage/HomePage.js"></script>
     
     <style>
  #feedback { font-size: 1.4em; }
  #listBills .paycheck.ui-selectee { background: #FFADAD; }
  #listBills .paycheck.ui-selected { background: #FF9999; color: white; }
    #listBills .invoice.ui-selecting { background: #FFAD5C; }
  #listBills .invoice.ui-selected { background: #FF9933, color: white; }
  #listBills { list-style-type: none; margin: 0; padding: 0; width: 40%; }
  #listBills li { margin: 3px; padding: 0.4em; font-size: 1em; height: 18px; }
  </style>
</head>
<body>
	
	<div class="content">
	    User <c:out value="${userFullName}"></c:out>

	    <br/>
	    Select your account:
	    <form id="dropdownform" action="LoginToHomeServlet" method="post">
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
  		<form id="list" action="PaycheckServlet" method="post">
  		   <input id="paycheckSelected" type="hidden" name="paycheckSelected" />
  		   <input id="typeOfItem" type="hidden" name="typeOfItem"/>
  		   <ul id="listBills">
  		     <c:forEach items="${sentPaychecks}" var="entry">
				<li class="paycheck" id="${entry.idPaycheck}">-&gt${entry.description}</li>		
				</c:forEach>
			 <c:forEach items="${receivedPaychecks}" var="entry">
				<li class="paycheck" id="${entry.idPaycheck}">&lt-${entry.description}</li>		
				</c:forEach>
				<li class="invoice">Probna smetka</li>
  		   </ul>
  		</form>
        </div>
       	<div id="tabs-2">
       	You can choose a receiver from the list:
       	 <form action="PaycheckServlet" method="post">
       	Choose one of your accounts:
       	 <select  name="selectedAccount">
	      	<c:forEach var="entry" items="${accounts}">
  				<option value="${entry.key}">${entry.value}</option>
			</c:forEach>
	    </select>
     
	    <input id="newPaycheck1" type="submit" value="Create Paycheck">
	    </form>
      	</div>
      	
        <div id="tabs-3">
        Choose a receiver from the list:
        <form action="InvoiceServlet" id="usersDropDownForm" method="post">
        <input id="sourceUser" type="hidden" name="sourceUser" value="${userid}"/>
        <select id="destinationUser" name="destinationUser">    
	      	<c:forEach var="entry" items="${users}">
  				<option value="${entry.key}">${entry.value}</option>
			</c:forEach>
	    </select>
	    
	    <input id="newPaycheck" type="submit" value="Create Invoice">
        </form>
        
        </div>
	    </div>
	</div>
</body>
</html>