
function initMap() {
	var mapDiv = document.getElementById('map');
	var map = new google.maps.Map(mapDiv, {
		center: {lat: 37.540, lng: 126.984355},
		zoom: 13
	});
// var lat = $("#lat").val();
//  	var long = $("#lng").val();
// var lat = <?php echo $lat; ?>; 


marker = new google.maps.Marker({
	map: map,
	draggable: true,
	animation: google.maps.Animation.DROP,
	position: {lat: parseFloat(lat), lng: parseFloat(lng)}
});

// alert(lat);


}

