
function initMap() {
     var mapDiv = document.getElementById('map');
     var map = new google.maps.Map(mapDiv, {
         center: {
             lat: 37.5663,
             lng: 126.9667
         },
         zoom: 12
     });
 }