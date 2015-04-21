<html>
<head>
	<title>Twitter Analysis</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/stima.css" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fluid">
	<br><br>
	<div class="row-fluid">
	
	<%-- Catalyzer = new StringMatching();
		Catalyzer.setAlgo(request.getParameter("algo")); --%>
	<%
		String Tquery= request.getParameter("Tquery");
		String internet = request.getParameter("internet");
		String gadget = request.getParameter("gadget");
		String sains = request.getParameter("sains");
		String Hquery = request.getParameter("Hquery");
		String film = request.getParameter("film");
		String musik = request.getParameter("musik");
		String game = request.getParameter("game");
		String Oquery = request.getParameter("Oquery");
		String pemain = request.getParameter("pemain");
		String tim = request.getParameter("tim");
		String pertandingan = request.getParameter("pertandingan");
		String Kquery = request.getParameter("Kquery");
		String kesehatan = request.getParameter("kesehatan");
		String kecantikan = request.getParameter("kecantikan");
		String produk = request.getParameter("produk");
	%>

	<div class="col-md-7">
			<ul class="nav nav-tabs">
			  <li class="nav active"><a href="#T" data-toggle="tab">Teknologi</a></li>
			  <li class="nav"><a href="#H" data-toggle="tab">Hiburan</a></li>
			  <li class="nav"><a href="#O" data-toggle="tab">Olahraga</a></li>
			  <li class="nav"><a href="#K" data-toggle="tab">Kesehatan & Kecantikan</a></li>
			</ul>

			<div class="tab-content" style="margin-left:5%;margin-right:5%">
		        <div class="tab-pane fade in active" id="T">
		        	<br><br>
					<% 	if (Tquery==null || Tquery.isEmpty()) {
							out.println("Anda tidak memasukkan keyword untuk topik ini");
						}
						else { %>
						<b><% out.print("tes"); %></b><br>
						<%
							out.print(Tquery);
							out.print(internet);
							out.print(gadget);
		    				out.print(sains);
		    			}
		    		%>
		        </div>
		        <div class="tab-pane fade" id="H">
		        	<br><br>
					
		        </div>
		        <div class="tab-pane fade" id="O">
		        	<br><br>
					
				</div>
		        <div class="tab-pane fade" id="K">
		        	<br><br>
					
		        </div>
		    </div>
		</div>
	</div>
</div>
	
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>

