<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.crm.connection.*"%>
<%@ page import="java.time.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
  </script>
<script src='//code.jquery.com/jquery-2.1.4.min.js'></script>
<style></style>
</head>
<body>

	<%int draw = 0;
	int draw2 = 0;
	int draw3 = 0;
	int draw4 = 0;
	int draw5 = 0;
	int draw6 = 0;	
	int dep = 0;
	
	
	int drawa = 0;
	int draw2a = 0;
	int draw3a = 0;
	int draw4a = 0;
	int draw5a = 0;
	int draw6a = 0;	
	int depa = 0;
	
	double diff=0;
	double diff2=0;
	double diff3=0;
	double diff4=0;
	double diff5=0;
	double diff6=0;
	double avg=0.0;
	double result=0.0;
	double finalResult=0.0;
	int myInt=0;
	
	double avg2=0.0;
	double result2=0.0;
	double finalResult2=0.0;
	int myInt2=0;
	
	double avg3=0.0;
	double result3=0.0;
	double finalResult3=0.0;
	int myInt3=0;
	
	double avg4=0.0;
	double result4=0.0;
	double finalResult4=0.0;
	int myInt4=0;
	
	long avg5=0;
	double result5=0;
	double finalResult5=0.0;
	int myInt5=0;
	
	double avg6=0.0;
	double result6=0.0;
	double finalResult6=0.0;
	int myInt6=0;
	int myInt7=0;
	String lessOrMore ="less";
	
	
	
	String st="%";
	Object accno = session.getAttribute("accountno");
	String acc=accno.toString();
	Connection con1 = GetCon.getCon();
	
	LocalDate presentMoth = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-YYYY");		      
  	String startDate=formatter.format((presentMoth.withDayOfMonth(1)));
  	String endDate=formatter.format(presentMoth.withDayOfMonth(presentMoth.lengthOfMonth()));
  	String today=formatter.format(presentMoth);
  	int dd=Integer.valueOf(endDate.substring(0,2)) - Integer.valueOf(today.substring(0,2));
  	System.out.println("Present moth Start date and End Date "+startDate +"--"+ endDate +"--"+today);

  	
  	
	LocalDate previousMonth = LocalDate.now().minusMonths(1);			
	DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("dd-MMM-YYYY");		      
  	String pmStartDate=formatter.format((previousMonth.withDayOfMonth(1)));
  	String pmEndDate=formatter.format(previousMonth.withDayOfMonth(previousMonth.lengthOfMonth()));
  	System.out.println("Previous moth Start date and End Date "+pmStartDate +"--"+ pmStartDate);
  	
  		try {
			
				String testQuery="Select * from TRANSCATIONS where accountno= "
						+ accno.toString() + " and narration like ('%bill%')   and deposit=0 and TRANSCATDATE BETWEEN '"+ startDate+"' AND '"+endDate+"' order by rowid";
			PreparedStatement ps2 = con1
					.prepareStatement(testQuery);
			System.out.println(testQuery);
		 	PreparedStatement ps3 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() + "and  narration like ('%online%') and deposit=0 and TRANSCATDATE BETWEEN '"+ startDate+"' AND '"+endDate+"' order by rowid");
			
		 	PreparedStatement ps4 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() + "and  narration like ('%Medical%') and deposit=0 and TRANSCATDATE BETWEEN '"+ startDate+"' AND '"+endDate+"' order by rowid");
			
			PreparedStatement ps5 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() +
							"and  narration like ('%transfer%') and deposit=0 and TRANSCATDATE BETWEEN '"+ startDate+"' AND '"+endDate+"' order by rowid");
			
			PreparedStatement ps6 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() +
							"and  narration like ('%grossories%')  and deposit=0 and TRANSCATDATE BETWEEN '"+ startDate+"' AND '"+endDate+"' order by rowid"); 
			
			
			String testQuerya="Select * from TRANSCATIONS where accountno= "
					+ accno.toString() + " and narration like ('%bill%')   and deposit=0 and TRANSCATDATE BETWEEN '"+ pmStartDate+"' AND '"+pmEndDate+"' order by rowid";

			PreparedStatement ps2a = con1
					.prepareStatement(testQuerya);
			System.out.println("test Query a "+testQuerya);
		 	PreparedStatement ps3a = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() + "and  narration like ('%online%') and deposit=0 and TRANSCATDATE BETWEEN '"+ pmStartDate+"' AND '"+pmEndDate+"' order by rowid");
			
		 	PreparedStatement ps4a = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() + "and  narration like ('%Medical%') and deposit=0 and TRANSCATDATE BETWEEN '"+ pmStartDate+"' AND '"+pmEndDate+"' order by rowid");
			
			PreparedStatement ps5a = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() +
							"and  narration like ('%transfer%') and deposit=0 and TRANSCATDATE BETWEEN '"+ pmStartDate+"' AND '"+pmEndDate+"' order by rowid");
			
			PreparedStatement ps6a = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString() +
							"and  narration like ('%grossories%')  and deposit=0 and TRANSCATDATE BETWEEN '"+ pmStartDate+"' AND '"+pmEndDate+"' order by rowid"); 
			
	
			
			
			ResultSet rs2 = ps2.executeQuery();
			while (rs2.next()) {
				
				int withdraw2 = rs2.getInt(3);
				draw2 = draw2 + withdraw2;		
				System.out.println("draw2!!"+draw2);
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
			
			
			
			
			
			
			
			
			ResultSet rs2a = ps2a.executeQuery();
			while (rs2a.next()) {
				
				int withdraw2a = rs2a.getInt(3);
				draw2a = draw2a + withdraw2a;		
				System.out.println("draw2a...."+draw2a);
							}
			
			 ResultSet rs3a = ps3a.executeQuery();
			while (rs3a.next()) {
				
				int withdraw3a = rs3a.getInt(3);
				draw3a = draw3a+ withdraw3a;				
							}
			System.out.println("draw3a"+draw3a);
			
			ResultSet rs4a = ps4a.executeQuery();
			while (rs4a.next()) {
				
				int withdraw4a = rs4a.getInt(3);
				draw4a= draw4a + withdraw4a;				
							}
			System.out.println("draw4a"+draw4a);
			
			
			ResultSet rs5a = ps5a.executeQuery();
			while (rs5a.next()) {
				
				int withdraw5a = rs5a.getInt(3);
				draw5a = draw5a + withdraw5a;				
							}
			ResultSet rs6a = ps6a.executeQuery();
			while (rs6a.next()) {
				
				int withdraw6a = rs6a.getInt(3);
				draw6a = draw6a + withdraw6a;				
							} 
			
			
			
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	%>





<%
System.out.println("Starting..."+draw2a  +"--"+draw2);
if(draw2a > draw2){
	 lessOrMore="less";
	 diff2=draw2a-draw2;
	 avg2=(draw2a+draw2)/2;
	 result2=Math.round((diff2/avg2));
	 finalResult2=Math.round(result2*10);

	myInt2 = (int) finalResult2;
	System.out.print("-myInt2-"+myInt2+lessOrMore);
}else if(draw2a > draw2){
	 lessOrMore="more";
	 diff2=draw2-draw2a;
	 avg2=(draw2+draw2a)/2;
	 result2=Math.round((diff2/avg2));
	 finalResult2=Math.round(result2*10);
	
	myInt2 = (int) finalResult2;
	System.out.print("-myInt2-"+myInt2+lessOrMore);
}else{
	
}


System.out.println("Starting draw3..."+draw3a  +"--"+draw3);
if(draw3a > draw3){
	lessOrMore="less";
	 diff3=draw3a-draw3;
	 avg3=(draw3a+draw3)/2;
	 result3=Math.round((diff3/avg3));
	 finalResult3=Math.round(result3*10);

	myInt3 = (int) finalResult3;
	System.out.print("-myInt3-"+myInt3+lessOrMore);
}else if(draw3a < draw3){
	lessOrMore="more";
	 diff3=draw3-draw3a;
	 avg3=(draw3+draw3a)/2;
	 result3=Math.round((diff3/avg3));
	 finalResult3=Math.round(result3*10);

	myInt3 = (int) finalResult3;
	System.out.print("-myInt3-"+myInt3+lessOrMore);
}else{
	
}


System.out.println("Starting draw4..."+draw4a  +"--"+draw4);
if(draw4a > draw4){
	lessOrMore="less";
	 diff4=draw4a-draw4;
	 avg4=(draw4a+draw4)/2;
	 result4=Math.round((diff4/avg4));
	 finalResult4=Math.round(result4*10);
	
	myInt4 = (int) finalResult4;
	System.out.print("-myInt4-"+myInt4+lessOrMore);
}else if(draw4a < draw4){
	lessOrMore="more";
	 diff4=draw4-draw4a;
	 avg4=(draw4+draw4a)/2;
	 result4=Math.round((diff4/avg4));
	 finalResult4=Math.round(result4*10);
	
	myInt4 = (int) finalResult4;
	System.out.print("-myInt4-"+myInt4+lessOrMore);
}else{
	
}



System.out.println("Starting draw5..."+draw5a  +"--"+draw5);
if(draw5a > draw5){
	lessOrMore="less";
	 diff5=draw5a-draw5;
	 avg5=(draw5a+draw5)/2;
	 result5=((double)(diff5/avg5)*10);
	
	myInt5 = (int) result5;
	System.out.print("-myInt5  if -"+myInt5+lessOrMore);
}else if(draw5a < draw5){
	lessOrMore="more";
	 diff5=draw5-draw5a;
	 System.out.println("diff5#"+diff5);
	 avg5=(draw5+draw5a)/2;
	 System.out.println("avg5#"+avg5);
	result5=((double)(diff5/avg5)*10);

	myInt5 = (int) result5;
	System.out.print("-myInt5  else-"+myInt5+lessOrMore);
}else{
	
}

System.out.println("Starting draw6..."+draw6a  +"--"+draw6);
if(draw6a > draw6){
	lessOrMore="less";
	 diff6=draw6a-draw6;
	 avg6=(draw6a+draw6)/2;
	 result6=((double)(diff6/avg6)*10);
	 System.out.print("result6--"+result6+lessOrMore);
		
	myInt6 = (int) result6;
	System.out.print("-myInt6-"+myInt6);
}else if(draw6a < draw6){
	lessOrMore="more";
	 diff6=draw6-draw6a;
	 avg6=(draw6+draw6a)/2;
	 result6=((double)(diff6/avg6)*10);
	 System.out.print("result6--"+result6+lessOrMore);
	 
	 
	myInt6 = (int) result6;
	System.out.print("-myInt6-"+myInt6);
}else{
	
}
%>

<p style="color:white;"> &nbsp;&nbsp;&nbsp;<%=dd %> days left before this month</p>
	<div id='myChart'></div>
	<script>
    var myConfig = {
      "type": "pie",
      "title": {
        "text": "Comparision report with previoius month..."
      },
      "subtitle": {
        "text": "Click the columns to view the complete transcation details..."
      },
      "plot": {
        "cursor": "hand",
        "value-box": {
          "placement": "out",
          "text": "%v%",
        },
        "tooltip": {
          "text": "%t"
        },
        "detach": false
      },
      
      
      "series": [{
        "values": [
<%=myInt2%>
        ],
        "text": "Bill payments Made by you are "+<%=myInt2-100%>+" less than previous month "
      },
      {
      "values": [
<%=myInt3%>
        ],
        "text": "Bill payments Made by you are "+<%=myInt3-100%>+" more than previous month "
      },
     
      
      {
        "values": [
<%=myInt4%>
        ],
        "text": "Medical payments Made by you are "+<%=myInt4-100%>+" less than previous month "
      },
      
      
      {
          "values": [
  <%=myInt5%>
          ],
          "text": "Medical payments Made by you are "+<%=myInt5-100%>+" more than previous month "
        },
        
        {
            "values": [
    <%=myInt6%>
            ],
            "text": "Medical payments Made by you are "+<%=myInt6-100%>+" less than previous month "
          }
      ]
    };

    zingchart.render({
      id: 'myChart',
      data: myConfig,
      height: 400,
      width: '100%'
    });

    /**
     * Handle the click event. Based on the plot clicked
     * re-direct the user!
     */
    zingchart.node_click = function(e) {
      switch (e.plotindex) {
         case 4:
        	 if (confirm("Do you want to view further details about BILL PAY")) {
             	window.open('http://localhost:8089/Spring1/logins/'+<%=acc%>+'/'+"bill1", '_blank'); 
             }
          break;
        case 3:
        	if (confirm("Do you want to view further details about BILL PAY")) {
            	window.open('http://localhost:8089/Spring1/logins/'+<%=acc%>+'/'+"bill1", '_blank'); 
            }
          break;
        case 2:
        	if (confirm("Do you want to view further details about BILL PAY")) {
            	window.open('http://localhost:8089/Spring1/logins/'+<%=acc%>+'/'+"bill1", '_blank'); 
            }
          break;
        case 1:
        	if (confirm("Do you want to view further details about BILL PAY")) {
            	window.open('http://localhost:8089/Spring1/logins/'+<%=acc%>+'/'+"bill1", '_blank'); 
            }
         
          break;
        default:
        	if (confirm("Do you want to view further details about BILL PAY")) {
            	window.open('http://localhost:8089/Spring1/logins/'+<%=acc%>+'/'+"bill1", '_blank'); 
            }
          break;
      }
    }
  </script>

</body>
</html>