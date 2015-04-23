<%@ page import="java.util.List, catalyzer" %> 
<%!
public String formatTweet(Status S) {
	return (
	"<div class=\"message-item\">"
	+"	<div class=\"message-inner\">"
	+"		<div class=\"message-head clearfix\">"
	+"			<div class=\"avatar pull-left\"><a href=\""
	+			S.getUser().getURL()
	+"			\"><img src=\""
	+			S.getUser().getProfileImageURL()
	+"			\"></div>"
	+"			<div class=\"user-detail\">"
	+"				<h5 class=\"handle\">"
	+				S.getUser().getName()
	+"				</h5>"
	+"				<div class=\"post-meta\">"
	+"					<div class=\"asker-meta\">"
	+"						<span class=\"qa-message-who\">"
	+"							<span class=\"qa-message-who-data\"><a href=\""
	+							S.getUser().getURL()
	+"							\">"
	+								S.getUser().getScreenName()
	+"							</a></span>"
	+"						</span> | "
	+"						<span class=\"qa-message-when\">"
	+"							<span class=\"qa-message-when-data\">"
	+							S.getCreatedAt()
	+"							</span>"
	+"						</span>"
	+"							<a href=\""
	+							"https://twitter.com/" + S.getUser().getScreenName + "/status/" + status.getId()
	+"							\" target=\"_blank\">"
	+"							<span class=\"glyphicon glyphicon-new-window\" aria-hidden=\"true\" style=\"position:absolute;right:15px;top:30px\"></span></a>"
	+"					</div>"
	+" 				</div>"
	+"			</div>"
	+"		</div>"
	+"		<div class=\"qa-message-content\">"
	+		S.getText()
	+"		</div>"
	+"	</div>"
	+"</div>"
	);
}
%>
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
	
	<% Catalyzer = new StringMatching();
		Catalyzer.setAlgo(request.getParameter("algo"));
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
						else {
							List<String> Twords = new List<String>();
							Twords.add(Tquery);
							Twords.add(internet);
							Twords.add(gadget);
		    				Twords.add(sains);
		    				List<List<Status>> Tresults = Catalyzer.Analyze(Twords);
		    				out.print("<div class=\"qa-message-list\" id=\"Tresults\">");
		    				for (int i=0;i<Tresults[0].length();i++) {
		    					out.print(formatTweet(Tresults[0][i]));
		    				}
		    				out.print("</div>");
		    			}
		    		%>
		    		
		    			<%	for (int i=0;i<3;i++) {
		    				out.print(formatTweet());
		    			} %>
		    		</div>



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

