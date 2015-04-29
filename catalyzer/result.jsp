<%@ page import="java.util.List, java.util.regex.*, java.util.ArrayList, stringmatch.*, twitter4j.*, twitter4j.conf.ConfigurationBuilder" %> 
<%!
public String formatTweet(Status S) {
	Pattern p = Pattern.compile("(d|D)i ([0-9A-Z&][a-zA-z-&]*(\\.)*\\s*)+");
    Matcher m = p.matcher(S.getText());
    String address="none";
    if (m.find())
    {  	
      String foundaddress = m.group(0);
      address = foundaddress.substring(3);
    }
	String tweet = "<div class=\"message-item\">"
	+"	<div class=\"message-inner\">"
	+"		<div class=\"message-head clearfix\">"
	+"			<div class=\"avatar pull-left\"><a href=\"http://twitter.com/"
	+			S.getUser().getScreenName()
	+"			\"><img src=\""
	+			S.getUser().getProfileImageURL()
	+"			\"></div>"
	+"			<div class=\"user-detail\">"
	+"				<h5 class=\"handle\">"
	+"				<h5 class=\"handle\">"
	+				S.getUser().getName()
	+"				</h5>"
	+"				<div class=\"post-meta\">"
	+"					<div class=\"asker-meta\">"
	+"						<span class=\"qa-message-who\">"
	+"							<span class=\"qa-message-who-data\"><a href=\"http://twitter.com/"
	+							S.getUser().getScreenName()
	+"							\">@"
	+								S.getUser().getScreenName()
	+"							</a></span>"
	+"						</span> | "
	+"						<span class=\"qa-message-when\">"
	+"							<span class=\"qa-message-when-data\">"
	+							S.getCreatedAt()
	+"							</span>"
	+"						</span>";
	if (!address.equals("none")) {
			tweet+="<a href=\"javascript:showAddress('"+address+"')\"><span class=\"glyphicon glyphicon-map-marker\" aria-hidden=\"true\" style=\"position:absolute;right:30px;top:30px\"></span></a>";
	}
	tweet+="							<a href=\""
	+							"https://twitter.com/" + S.getUser().getScreenName() + "/status/" + S.getId()
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
	+"</div>";
	return tweet;
}
%>
<html>
<head>
	
	<link rel="shortcut icon" href="design/catalyzer_ico.ico">
	<title>CATalyzer</title>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/stima.css" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Dosis' rel='stylesheet' type='text/css'>
	<script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.js"></script>
   <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAjU0EJWnWPMv7oQ-jjS7dYxSPW5CJgpdgO_s4yyMovOaVh_KvvhSfpvagV18eOyDWu7VytS6Bi1CWxw"
      type="text/javascript"></script>
    <script type="text/javascript">

    var map = null;
    var geocoder = null;

    function initialize() {
    initializeMap();
    highlightall();
    }
    function initializeMap() {
    	if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map_canvas"));
        map.setUIToDefault();
        map.setCenter(new GLatLng(37.4419, -122.1419), 1);
        geocoder = new GClientGeocoder();
        google.maps.event.trigger(map, 'resize');
      }
    }
    function showAddress(address) {
      if ($('#map_canvas').is(':visible')) {
      	$('#map_canvas').hide();
      	$('#catimage').show();
      } else {
	      if (geocoder) {
        geocoder.getLatLng(
          address,
          function(point) {
            if (!point) {
              alert(address + " not found");
            } else {
              map.setCenter(point, 15);
              var marker = new GMarker(point, {draggable: true});
              map.addOverlay(marker);
              GEvent.addListener(marker, "dragend", function() {
                marker.openInfoWindowHtml(marker.getLatLng().toUrlValue(6));
              });
              GEvent.addListener(marker, "click", function() {
                marker.openInfoWindowHtml(marker.getLatLng().toUrlValue(6));
              });
        GEvent.trigger(marker, "click");
        google.maps.event.trigger(map, 'resize');
            }
          }
        );
        $('#catimage').hide();
        $('#map_canvas').show();
        google.maps.event.trigger(map, 'resize');
      }
 	 }
  }

    
    </script>
</head>
<body onload="initialize()" onunload="GUnload()">

<div id = "result-page">
<div class="container-fluid">
	<br><br>
	<div class="row" style="height:380px">
	
	<% StringMatching Catalyzer = new StringMatching();
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
		String gadgetresults = "";
		String sainsresults = "";
		String internetresults = "";
		String Tunknownresults = "";
		String filmresults = "";
		String musikresults = "";
		String gameresults = "";
		String Hunknownresults = "";
		String pemainresults = "";
		String timresults = "";
		String pertandinganresults = "";
		String Ounknownresults = "";
		String kesehatanresults = "";
		String kecantikanresults = "";
		String produkresults = "";
		String Kunknownresults = "";
		if (Tquery!=null && !Tquery.isEmpty()) {
			List<String> Twords = new ArrayList<String>();
			Twords.add(Tquery);
			Twords.add(gadget);
			Twords.add(sains);
			Twords.add(internet);
			List<List<Status>> Tresults = new ArrayList<List<Status>>();
			Tresults = Catalyzer.Analyze(Twords);
			int i;
			if (Tresults.get(0).size()>0) {
				for (i=0;i<Tresults.get(0).size();i++) {
					gadgetresults += (formatTweet(Tresults.get(0).get(i)));
				}
			}
			if (Tresults.get(1).size()>0) {
				for (i=0;i<Tresults.get(1).size();i++) {
					sainsresults  += (formatTweet(Tresults.get(1).get(i)));
				}
			}
			if (Tresults.get(2).size()>0) {
				for (i=0;i<Tresults.get(2).size();i++) {
					internetresults += (formatTweet(Tresults.get(2).get(i)));
				}
			}
			if (Tresults.get(3).size()>0) {
				for (i=0;i<Tresults.get(3).size();i++) {
					Tunknownresults += (formatTweet(Tresults.get(3).get(i)));
				}
			}
		}
		if (Hquery!=null && !Hquery.isEmpty()) {
			List<String> Hwords = new ArrayList<String>();
			Hwords.add(Hquery);
			Hwords.add(film);
			Hwords.add(musik);
			Hwords.add(game);
			List<List<Status>> Hresults = new ArrayList<List<Status>>();
			Hresults = Catalyzer.Analyze(Hwords);
			int i;
			if (Hresults.get(0).size()>0) {
				for (i=0;i<Hresults.get(0).size();i++) {
					filmresults += (formatTweet(Hresults.get(0).get(i)));
				}
			}
			if (Hresults.get(1).size()>0) {
				for (i=0;i<Hresults.get(1).size();i++) {
					musikresults += (formatTweet(Hresults.get(1).get(i)));
				}
			}
			if (Hresults.get(2).size()>0) {
				for (i=0;i<Hresults.get(2).size();i++) {
					gameresults += (formatTweet(Hresults.get(2).get(i)));
				}
			}
			if (Hresults.get(3).size()>0) {
				for (i=0;i<Hresults.get(3).size();i++) {
					Hunknownresults += (formatTweet(Hresults.get(3).get(i)));
				}
			}
		}
		if (Oquery!=null && !Oquery.isEmpty()) {
			List<String> Owords = new ArrayList<String>();
			Owords.add(Oquery);
			Owords.add(pemain);
			Owords.add(tim);
			Owords.add(pertandingan);
			List<List<Status>> Oresults = new ArrayList<List<Status>>();
			Oresults = Catalyzer.Analyze(Owords);
			int i;
			if (Oresults.get(0).size()>0) {
				for (i=0;i<Oresults.get(0).size();i++) {
					pemainresults += (formatTweet(Oresults.get(0).get(i)));
				}
			}
			if (Oresults.get(1).size()>0) {
				for (i=0;i<Oresults.get(1).size();i++) {
					timresults += (formatTweet(Oresults.get(1).get(i)));
				}
			}
			if (Oresults.get(2).size()>0) {
				for (i=0;i<Oresults.get(2).size();i++) {
					pertandinganresults += (formatTweet(Oresults.get(2).get(i)));
				}
			}
			if (Oresults.get(3).size()>0) {
				for (i=0;i<Oresults.get(3).size();i++) {
					Ounknownresults += (formatTweet(Oresults.get(3).get(i)));
				}
			}
		}

		if (Kquery!=null && !Kquery.isEmpty()) {
			List<String> Kwords = new ArrayList<String>();
			Kwords.add(Kquery);
			Kwords.add(kesehatan);
			Kwords.add(kecantikan);
			Kwords.add(produk);
			List<List<Status>> Kresults = new ArrayList<List<Status>>();
			Kresults = Catalyzer.Analyze(Kwords);
			int i;
			if (Kresults.get(0).size()>0) {
				for (i=0;i<Kresults.get(0).size();i++) {
					kesehatanresults += (formatTweet(Kresults.get(0).get(i)));
				}
			}
			if (Kresults.get(1).size()>0) {
				for (i=0;i<Kresults.get(1).size();i++) {
					kecantikanresults += (formatTweet(Kresults.get(1).get(i)));
				}
			}
			if (Kresults.get(2).size()>0) {
				for (i=0;i<Kresults.get(2).size();i++) {
					produkresults += (formatTweet(Kresults.get(2).get(i)));
				}
			}
			if (Kresults.get(3).size()>0) {
				for (i=0;i<Kresults.get(3).size();i++) {
					Kunknownresults += (formatTweet(Kresults.get(3).get(i)));
				}
			}
		}

	%>

	<div class="col-md-7">
			<ul class="nav nav-tabs">
			  <li class="nav active tab" id="TTab"><a href="#T" data-toggle="tab">Teknologi</a></li>
			  <li class="nav tab" id="HTab"><a href="#H" data-toggle="tab">Hiburan</a></li>
			  <li class="nav tab" id="OTab"><a href="#O" data-toggle="tab">Olahraga</a></li>
			  <li class="nav tab" id="KTab"><a href="#K" data-toggle="tab">Kesehatan & Kecantikan</a></li>
			</ul>

			<div class="tab-content" id="tab-content" style="border:1px solid #ddd;border-radius:0px 0px 20px 20px;border-top:0px;padding:40px">
		        <div class="tab-pane fade in active" id="T">
					<% 	if (Tquery==null || Tquery.isEmpty()) {
							out.println("Anda tidak memasukkan keyword untuk topik ini");
						}
						else {
							String Thtml="<div id=\"TCarousel\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"false\">"
							+"    <div class=\"btn-group btn-group-justified\" role=\"group\">"
							+"      <a data-target=\"#TCarousel\" data-slide-to=\"0\" href=\"#\" class=\"btn btn-default active\">Gadget</a>"
							+"      <a data-target=\"#TCarousel\" data-slide-to=\"1\" href=\"#\" class=\"btn btn-default\">Sains</a>"
							+"      <a data-target=\"#TCarousel\" data-slide-to=\"2\" href=\"#\" class=\"btn btn-default\">Internet</a>"
							+"      <a data-target=\"#TCarousel\" data-slide-to=\"3\" href=\"#\" class=\"btn btn-default\">Unknown</a>"
							+"    </div>"
							+"    <br>"
							+"    <!-- Indicators -->"
							+"    <ol class=\"carousel-indicators\">"
							+"      <li data-target=\"#TCarousel\" data-slide-to=\"0\" class=\"active\"></li>"
							+"      <li data-target=\"#TCarousel\" data-slide-to=\"1\"></li>"
							+"      <li data-target=\"#TCarousel\" data-slide-to=\"2\"></li>"
							+"      <li data-target=\"#TCarousel\" data-slide-to=\"3\"></li>"
							+"    </ol>"
							+"    <!-- Wrapper for slides -->"
							+"    <div class=\"carousel-inner\" role=\"listbox\" style = \"height:95%;overflow-y:auto;overflow-x:hidden;padding-right:10px\">"
							+"      <div class=\"item active\">"
							+"     	<div class=\"qa-message-list\" id=\"gadgetmsg\">"
							+			gadgetresults
							+"     	</div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      <div class=\"qa-message-list\" id=\"sainsmsg\">"
							+			sainsresults
							+"      </div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      	<div class=\"qa-message-list\" id=\"internetmsg\">"
							+			internetresults
							+"      	</div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      	<div class=\"qa-message-list\">"
							+			Tunknownresults
							+"      	</div>"
							+"      </div>"
							+"    </div><!--carousel-inner-->"
							+"</div><!--carousel-->";
							out.println(Thtml);
		    			}
		    		%>
		    		</div>

		        <div class="tab-pane fade" id="H">
		        	<% 	if (Hquery==null || Hquery.isEmpty()) {
							out.println("Anda tidak memasukkan keyword untuk topik ini");
						}
						else {
							String Hhtml="<div id=\"HCarousel\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"false\">"
							+"    <div class=\"btn-group btn-group-justified\" role=\"group\">"
							+"      <a data-target=\"#HCarousel\" data-slide-to=\"0\" href=\"#\" class=\"btn btn-default active\">Film</a>"
							+"      <a data-target=\"#HCarousel\" data-slide-to=\"1\" href=\"#\" class=\"btn btn-default\">Musik</a>"
							+"      <a data-target=\"#HCarousel\" data-slide-to=\"2\" href=\"#\" class=\"btn btn-default\">Game</a>"
							+"      <a data-target=\"#HCarousel\" data-slide-to=\"3\" href=\"#\" class=\"btn btn-default\">Unknown</a>"
							+"    </div>"
							+"    <br>"
							+"    <!-- Indicators -->"
							+"    <ol class=\"carousel-indicators\">"
							+"      <li data-target=\"#HCarousel\" data-slide-to=\"0\" class=\"active\"></li>"
							+"      <li data-target=\"#HCarousel\" data-slide-to=\"1\"></li>"
							+"      <li data-target=\"#HCarousel\" data-slide-to=\"2\"></li>"
							+"      <li data-target=\"#HCarousel\" data-slide-to=\"3\"></li>"
							+"    </ol>"
							+"    <!-- Wrapper for slides -->"
							+"    <div class=\"carousel-inner\" role=\"listbox\" style = \"height:95%;overflow-y:auto;overflow-x:hidden;padding-right:10px\">"
							+"      <div class=\"item active\">"
							+"     	<div class=\"qa-message-list\" id=\"filmmsg\">"
							+			filmresults
							+"     	</div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      <div class=\"qa-message-list\" id=\"musikmsg\">"
							+			musikresults
							+"      </div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      	<div class=\"qa-message-list\" id=\"gamemsg\">"
							+			gameresults
							+"      	</div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      	<div class=\"qa-message-list\">"
							+			Hunknownresults
							+"      	</div>"
							+"      </div>"
							+"    </div><!--carousel-inner-->"
							+"</div><!--carousel-->";
							out.println(Hhtml);
		    			}
		    		%>
					
		        </div>
		        <div class="tab-pane fade" id="O">
		        	<% 	if (Oquery==null || Oquery.isEmpty()) {
							out.println("Anda tidak memasukkan keyword untuk topik ini");
						}
						else {
							String Ohtml="<div id=\"OCarousel\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"false\">"
							+"    <div class=\"btn-group btn-group-justified\" role=\"group\">"
							+"      <a data-target=\"#OCarousel\" data-slide-to=\"0\" href=\"#\" class=\"btn btn-default active\">Pemain</a>"
							+"      <a data-target=\"#OCarousel\" data-slide-to=\"1\" href=\"#\" class=\"btn btn-default\">Tim</a>"
							+"      <a data-target=\"#OCarousel\" data-slide-to=\"2\" href=\"#\" class=\"btn btn-default\">Pertandingan</a>"
							+"      <a data-target=\"#OCarousel\" data-slide-to=\"3\" href=\"#\" class=\"btn btn-default\">Unknown</a>"
							+"    </div>"
							+"    <br>"
							+"    <!-- Indicators -->"
							+"    <ol class=\"carousel-indicators\">"
							+"      <li data-target=\"#OCarousel\" data-slide-to=\"0\" class=\"active\"></li>"
							+"      <li data-target=\"#OCarousel\" data-slide-to=\"1\"></li>"
							+"      <li data-target=\"#OCarousel\" data-slide-to=\"2\"></li>"
							+"      <li data-target=\"#OCarousel\" data-slide-to=\"3\"></li>"
							+"    </ol>"
							+"    <!-- Wrapper for slides -->"
							+"    <div class=\"carousel-inner\" role=\"listbox\" style = \"height:95%;overflow-y:auto;overflow-x:hidden;padding-right:10px\">"
							+"      <div class=\"item active\">"
							+"     	<div class=\"qa-message-list\" id=\"pemainmsg\">"
							+			pemainresults
							+"     	</div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      <div class=\"qa-message-list\" id=\"timmsg\">"
							+			timresults
							+"      </div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      	<div class=\"qa-message-list\" id=\"pertandinganmsg\">"
							+			pertandinganresults
							+"      	</div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      	<div class=\"qa-message-list\">"
							+			Ounknownresults
							+"      	</div>"
							+"      </div>"
							+"    </div><!--carousel-inner-->"
							+"</div><!--carousel-->";
							out.println(Ohtml);
		    			}
		    		%>
					
				</div>
		        <div class="tab-pane fade" id="K">
		        	<% 	if (Kquery==null || Kquery.isEmpty()) {
							out.println("Anda tidak memasukkan keyword untuk topik ini");
						}
						else {
							String Khtml="<div id=\"KCarousel\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"false\">"
							+"    <div class=\"btn-group btn-group-justified\" role=\"group\">"
							+"      <a data-target=\"#KCarousel\" data-slide-to=\"0\" href=\"#\" class=\"btn btn-default active\">Kesehatan</a>"
							+"      <a data-target=\"#KCarousel\" data-slide-to=\"1\" href=\"#\" class=\"btn btn-default\">Kecantikan</a>"
							+"      <a data-target=\"#KCarousel\" data-slide-to=\"2\" href=\"#\" class=\"btn btn-default\">Produk</a>"
							+"      <a data-target=\"#KCarousel\" data-slide-to=\"3\" href=\"#\" class=\"btn btn-default\">Unknown</a>"
							+"    </div>"
							+"    <br>"
							+"    <!-- Indicators -->"
							+"    <ol class=\"carousel-indicators\">"
							+"      <li data-target=\"#KCarousel\" data-slide-to=\"0\" class=\"active\"></li>"
							+"      <li data-target=\"#KCarousel\" data-slide-to=\"1\"></li>"
							+"      <li data-target=\"#KCarousel\" data-slide-to=\"2\"></li>"
							+"      <li data-target=\"#KCarousel\" data-slide-to=\"3\"></li>"
							+"    </ol>"
							+"    <!-- Wrapper for slides -->"
							+"    <div class=\"carousel-inner\" role=\"listbox\" style = \"height:95%;overflow-y:auto;overflow-x:hidden;padding-right:10px\">"
							+"      <div class=\"item active\">"
							+"     	<div class=\"qa-message-list\" id=\"kesehatanmsg\">"
							+			kesehatanresults
							+"     	</div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      <div class=\"qa-message-list\" id=\"kecantikanmsg\">"
							+			kecantikanresults
							+"      </div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      	<div class=\"qa-message-list\" id=\"produkmsg\">"
							+			produkresults
							+"      	</div>"
							+"      </div>"
							+"      <div class=\"item\">"
							+"      	<div class=\"qa-message-list\">"
							+			Kunknownresults
							+"      	</div>"
							+"      </div>"
							+"    </div><!--carousel-inner-->"
							+"</div><!--carousel-->";
							out.println(Khtml);
		    			}
		    		%>
		        </div>
		    </div>
		</div>
	</div>
	<a href="about.html" id="catimage" class="TTab"></a>
	<div id="map_canvas" style="width:400px;height:400px;position:absolute;top:15%;left:60%;display:none;"></div>
</div>
</div>
<script type="text/javascript">
      $(".btn-group > .btn").click(function(){
    	$(this).addClass("active").siblings().removeClass("active");
		});

		$('.tab').click(function(){
		$('#catimage').removeClass();
		$('#catimage').addClass(this.id);
		})

		function highlight(text,id) {
			var splittext = text.split(",");
			for (var i = splittext.length - 1; i >= 0; i--) {
				$(id).highlight(splittext[i].trim());
			}
		}
		function highlightall() {
			alert("tes2");
			highlight("<%=internet%>",internetmsg);
			highlight("<%=gadget%>",gadgetmsg);
			highlight("<%=sains%>",sainsmsg);
			highlight("<%=film%>",filmmsg);
			highlight("<%=musik%>",musikmsg);
			highlight("<%=game%>",gamemsg);
			highlight("<%=pemain%>",pemainmsg);
			highlight("<%=tim%>",timmsg);
			highlight("<%=pertandingan%>",pertandinganmsg);
			highlight("<%=kecantikan%>",kecantikanmsg);
			highlight("<%=kesehatan%>",kesehatanmsg);
			highlight("<%=produk%>",produkmsg);
		}
    }
 </script>
    
</body>
</html>

