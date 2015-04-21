<html>
<head>
	<title>Twitter Analysis</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/stima.css" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
	<br><br>
	<ul class="nav nav-tabs">
	  <li class="nav active"><a href="#T" data-toggle="tab">Teknologi</a></li>
	  <li class="nav"><a href="#H" data-toggle="tab">Hiburan</a></li>
	  <li class="nav"><a href="#O" data-toggle="tab">Olahraga</a></li>
	  <li class="nav"><a href="#K" data-toggle="tab">Kesehatan & Kecantikan</a></li>
	</ul>

	<div class="tab-content">
        <div class="tab-pane fade in active" id="T">
        	<br><br>
        	 <form class="form-horizontal" role="form" action="results.jsp" method="POST">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="Tquery">Pencarian twitter:</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="Tquery" name="Tquery" placeholder="">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="internet">Kategori internet:</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="internet" name="internet" placeholder="">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="gadget">Kategori gadget:</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="gadget" name="internet" placeholder="">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="inovasi">Kategori inovasi:</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="inovasi" name="inovasi" placeholder="">
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">Submit</button>
			    </div>
			  </div>
			</form>
        </div>
        <div class="tab-pane fade" id="H">Pencarian hiburan</div>
        <div class="tab-pane fade" id="O">Pencarian olahraga</div>
        <div class="tab-pane fade" id="K">Pencarian kesehatan & kecantikan</div>
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