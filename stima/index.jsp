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
	<form class="form-horizontal" role="form" action="resultsnyoba2.jsp" method="POST">
		<div class="col-md-7">
			<ul class="nav nav-tabs">
			  <li class="nav active"><a href="#T" data-toggle="tab">Teknologi</a></li>
			  <li class="nav"><a href="#H" data-toggle="tab">Hiburan</a></li>
			  <li class="nav"><a href="#O" data-toggle="tab">Olahraga</a></li>
			  <li class="nav"><a href="#K" data-toggle="tab">Kesehatan & Kecantikan</a></li>
			</ul>

			<div class="tab-content">
		        <div class="tab-pane fade in active" id="T">
		        	<br><br>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="Tquery">Pencarian twitter:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="Tquery" name="Tquery" placeholder="Contoh: #teknologi">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="internet">Kategori internet:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="internet" name="internet" placeholder="Contoh: web, facebook, twitter, online">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="gadget">Kategori gadget:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="gadget" name="gadget" placeholder="Contoh: android, apple, ipad, smartwatch">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="sains">Kategori sains:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="sains" name="sains" placeholder="Contoh: NASA, robot, energi">
					    </div>
					  </div>
		        </div>
		        <div class="tab-pane fade" id="H">
		        	<br><br>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="Hquery">Pencarian twitter:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="Hquery" name="Hquery" placeholder="Contoh: #hiburan">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="film">Kategori film/TV:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="film" name="film" placeholder="Contoh: nonton, blitzmegaplex, 21, video">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="musik">Kategori musik:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="musik" name="musik" placeholder="Contoh: band, album, konser, radio">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="game">Kategori game:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="game" name="game" placeholder="Contoh: main, playstation, steam, xbox">
					    </div>
					  </div>
		        </div>
		        <div class="tab-pane fade" id="O">
		        	<br><br>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="Oquery">Pencarian twitter:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="Oquery" name="Oquery" placeholder="Contoh: #olahraga">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="pemain">Kategori pemain:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="pemain" name="pemain" placeholder="Contoh: david beckham, michael jordan">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="tim">Kategori tim:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="tim" name="tim" placeholder="Contoh: liverpool, juventus, persib">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="pertandingan">Kategori pertandingan:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="pertandingan" name="pertandingan" placeholder="Contoh: piala dunia, final, liga">
					    </div>
					  </div>
				</div>
		        <div class="tab-pane fade" id="K">
		        	<br><br>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="Kquery">Pencarian twitter:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="Kquery" name="Kquery" placeholder="Contoh: #kesehatan, #kecantikan">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="kesehatan">Kategori kesehatan:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="kesehatan" name="kesehatan" placeholder="Contoh: obat, penyembuhan, penyakit, efek samping">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="kecantikan">Kategori kecantikan:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="kecantikan" name="kecantikan" placeholder="Contoh: kulit, rambut, jerawat, langsing">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-md-3" for="produk">Kategori produk:</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="produk" name="produk" placeholder="Contoh: lotion, lipstick, herbalife, clear">
					    </div>
					  </div>
		        </div>
		    </div>
		    <hr>
		    <div class="form-group">
		  	<label class="control-label col-md-3">Algoritma:</label>
		    <div class="col-md-8">
			  	<label class="radio-inline"><input type="radio" name="algo" value="BM" required>Boyer-Moore</label>
              	<label class="radio-inline"><input type="radio" name="algo" value="KMP" required>KMP</label> 
            </div>
		  </div>
		  <div class="form-group">
		    <div class="col-md-offset-4">
		      <button type="submit" class="btn btn-default">Analisis</button>
		    </div>
		  </div>
		</div>
	</form>
	</div>
</div>
	<%-- START --%>
	<%--
	    out.println("UserName = aavik ");
	    out.println("Running first program in JSP.");
	--%>
	<%-- END --%>

	
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>