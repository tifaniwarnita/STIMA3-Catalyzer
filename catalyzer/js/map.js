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
      }
    }
  }