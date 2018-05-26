<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.crm.connection.*"%>

<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>

	<%int draw = 0;
	int draw2 = 0;
	int draw3 = 0;
	int draw4 = 0;
	int draw5 = 0;
	int draw6 = 0;
	
	int dep = 0;
	Object accno = session.getAttribute("accountno");
	String acc=accno.toString();
		try {

			
			System.out.println("accno in pie" + accno.toString());
			Connection con1 = GetCon.getCon();
			
			
			
			PreparedStatement ps1 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString());
			

			PreparedStatement ps2 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() + "and narration like ('%bill%')   and deposit=0");
			
		 	PreparedStatement ps3 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() + "and  narration like ('%online%') and deposit=0");
			
		 	PreparedStatement ps4 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() + "and  narration like ('%Medical%') and deposit=0");
			
			PreparedStatement ps5 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() +
							"and  narration like ('%transfer%') and deposit=0");
			
			PreparedStatement ps6 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() +
							"and  narration like ('%grossories%')  and deposit=0"); 
			
			
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				
				int withdrawl = rs1.getInt(3);
				draw = draw + withdrawl;
				
				int deposit = rs1.getInt(4);
				dep = dep + deposit;

			}
			
			
			
			ResultSet rs2 = ps2.executeQuery();
			while (rs2.next()) {
				
				int withdraw2 = rs2.getInt(3);
				draw2 = draw2 + withdraw2;		
				System.out.println("draw2"+draw2);
							}
			
			 ResultSet rs3 = ps3.executeQuery();
			while (rs3.next()) {
				
				int withdraw3 = rs3.getInt(3);
				draw3 = draw3+ withdraw3;				
							}
			System.out.println("draw3"+draw3);
			
			ResultSet rs4 = ps4.executeQuery();
			while (rs4.next()) {
				
				int withdraw4 = rs4.getInt(3);
				draw4= draw4 + withdraw4;				
							}
			System.out.println("draw4"+draw4);
			
			
			ResultSet rs5 = ps5.executeQuery();
			while (rs5.next()) {
				
				int withdraw5 = rs5.getInt(3);
				draw5 = draw5 + withdraw5;				
							}
			ResultSet rs6 = ps6.executeQuery();
			while (rs6.next()) {
				
				int withdraw6 = rs6.getInt(3);
				draw6 = draw6 + withdraw6;				
							} 
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	%>

	
		<script type="text/javascript">

		 // Load the Visualization API and the piechart package.
	      google.charts.load('current', {'packages':['corechart']});

	      // Set a callback to run when the Google Visualization API is loaded.
	      google.charts.setOnLoadCallback(drawChart);

	      // Callback that creates and populates a data table,
	      // instantiates the pie chart, passes in the data and
	      // draws it.
	      function drawChart() {

	        // Create the data table.
	        var data = new google.visualization.DataTable();
	        data.addColumn('string', 'Topping');
	        data.addColumn('number', 'Slices');
	        data.addRows([  [ 'BILL PAY',  <%=draw2%>],[ 'DEPOSIT',  <%=dep%>], [ 'ONLINE PAYMENTS',  <%=draw3%>], [ 'MEDICAL',  <%=draw4%>], [ 'TRANSFERS',  <%=draw5%>], [ 'GROSSORRIES',  <%=draw6%>] ]);

	        // Set chart options
	        var options = {'title':'Your Banking Transcations Report',
	                       'width':2000,
	                       'height':500};
	 
	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));

	        function selectHandler() {
	          var selectedItem = chart.getSelection()[0];
	          if (selectedItem) {
	            var topping = data.getValue(selectedItem.row, 0);
	            
	            if(topping=='BILL PAY'){
	            	topping='bill';
	            }else if(topping=='DEPOSIT'){
	            	topping='bill';
	            }else if(topping=='ONLINE PAYMENTS'){
	            	topping='online';
	            }else if(topping=='MEDICAL'){
	            	topping='medical';
	            }else if(topping=='TRANSFERS'){
	            	topping='transfer';
	            }else if(topping=='GROSSORRIES'){
	            	topping='grossories';
	            }
	         	            
	            if (confirm("Do you want to view further details about "+topping)) {
	            	window.open('http://localhost:8089/Spring1/logins/'+<%=acc%>+'/'+topping, '_blank');
	            
	            			
	            	
	            } else {
	                
	            }
	            
	           // alert('The user selected ' + topping);
				
	          }
	        }

	        google.visualization.events.addListener(chart, 'select', selectHandler);    
	        chart.draw(data, options);
	      }

	    </script>
		

	<div id="chart_div" style="width: 1200px; height: 500px;"></div>
</body>
</html>