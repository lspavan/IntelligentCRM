<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
			<%@ page import="java.io.*"%>
			<%@ page import="javax.servlet.*"%>
			<%@ page import="com.crm.connection.*"%>
			<%@ page import="java.time.*"%>
			<%@ page import="java.time.format.DateTimeFormatter"%>
<html>
<head>

<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}
</style>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Intelligent CRM</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}

</script>

</head>

<body>

	


 <%
int accountN = (int) request.getAttribute("accountNo");
 String narr=(String)request.getAttribute("topping");
request.setAttribute("accountNo", accountN);
System.out.print(narr);
boolean check=false;
String query="";

%>
					<table align="center">
						<%
						
						LocalDate presentMoth = LocalDate.now();
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-YYYY");		      
					  	String startDate=formatter.format((presentMoth.withDayOfMonth(1)));
					  	String endDate=formatter.format(presentMoth.withDayOfMonth(presentMoth.lengthOfMonth()));
					  	System.out.println ("start date and end date" +startDate + endDate);					  	
					  	String today=formatter.format(presentMoth);
						
						

try {
		    Connection con1=GetCon.getCon();	
		    
		    if(narr.equals("bill") || narr.equals("online") || narr.equals("Medical") || narr.equals("transfer") || narr.equals("grossories")){
		    	check=true;
		    	query=" and TRANSCATDATE BETWEEN '"+ startDate+"' AND '"+today+"' ";
		    	
		    	System.out.println(query +"---"+narr);
		    }else{
		    	check=false;
		    	narr = narr.substring(0, narr.length() - 1);
		    	System.out.println(query +"---"+narr);
		    }
		   
			PreparedStatement ps1=con1.prepareStatement("Select * from TRANSCATIONS WHERE accountno= "+accountN +" and narration like ('%"+narr+"%')  and deposit=0" + query+" order by rowid desc");         
			ResultSet rs1=ps1.executeQuery();
		    
			//PreparedStatement ps1=con1.prepareStatement("Select accountno from NEWACCOUNT where accountno='"+passedaccountno+"'");
          
            
            System.out.println("After result set");
      
        
			
			out.print("<table align='center'  ");
				
			out.print("<tr><th>ACCOUNTNo</th><th>TRANSCATIONDATE</th><th>NARRATION</th><th>WITHDRAWL</th><th>DEPOSIT</th><th>BALANCE</th></tr>");
			
			while(rs1.next()){				
				out.print("<tr>");
				out.print("<td> <font color='black'>" + rs1.getInt(6) + "</font></td>");				
				out.print("<td> <font color='black'>" + rs1.getString(1) + "</font></td>");
				out.print("<td> <font color='black'>" + rs1.getString(2) + "</font></td>");
				if(rs1.getInt(3)!=0){
					out.print("<td> <font color='red'>" + rs1.getInt(3) + "</font></td>");
				}else{
				out.print("<td> <font color='black'>" + rs1.getInt(3) + "</font></td>");
				}
				if(rs1.getInt(4)!=0){
				out.print("<td> <font color='green'>" + rs1.getInt(4) + "</font></td>");
				}else{
					out.print("<td> <font color='black'>" + rs1.getInt(4) + "</font></td>");
				}
				out.print("<td> <font color='black'>" + rs1.getInt(5) + "</font></td>");
								
			
				session.setAttribute("accountno",(int)rs1.getInt(6));
			    
				out.print("</tr>");
			    
			}
			
			out.print("</table>");
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
   
			%>
					</table> 
	<center><a href="javascript:close_window();">close</a></center>

<script type="text/javascript">
document.onload = ctck();
function close_window() {
	  if (confirm("Close Window?")) {
	    close();
	  }
	}
</script>
<br><br><br><br>
</body></html>

			