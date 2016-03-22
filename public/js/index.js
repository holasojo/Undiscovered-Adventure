/*jslint browser: true*/
/*global $, jQuery, alert*/




var imgs = ["1.jpg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "7.jpeg"];
var $str;
var $str2;
var first = true;

function secondImage() {

	var $ran2 = Math.floor(Math.random() * 7);
	$('#bg2').css({
		'background-image': 'url("'+$str2+'")'
	}).hide();

	$('#bg2').fadeIn(2000, function () {
		setTimeout("$('#bg2').fadeOut(3500); firstImage();", 8000);
	});

}
function firstImage() {
	loadJsonpImg();
	var $ran = Math.floor(Math.random() * 7);
	$('#bg1').css({
		'background-image': 'url("'+$str+'")'
	});

	$('#bg1').fadeIn(2000, function () {
		setTimeout("$('#bg1').fadeOut(3500); secondImage();", 8000);
	});
}



function loadJsonpImg() {
  // Read more on JQuery site: https://learn.jquery.com/ajax/working-with-jsonp/
  var pagenum = Math.floor((Math.random() * 100) + 1); 
  // Using Flickr API and JSONP
  $.ajax({
  	url: "https://api.flickr.com/services/rest/",

      // The name of the callback, as specified by Flickr
      jsonp: 'jsoncallback',

      // Tell jQuery we're expecting JSONP
      dataType: "jsonp",

      // Tell Flickr what we want and that we want JSON
      data: {
      	method: "flickr.photos.search",
      	api_key: "e79fbe1c09f0ad7c1f3efa0b90943db6",
      	text: encodeURI("travel"),
      	page: "90",
      	extras: "url_o",
      	sort: "relevent",
      	safe_search: 1,
      	format: "json"
      },

      // Work with the response
      success: function( response ) {
          var rand = Math.floor((Math.random() * 100) + 1); // random number between 1 and 10
          // alert(rand);
          var rand2 = Math.floor((Math.random() * 100) + 1); 
          var src = response.photos.photo[rand].url_o;
          var src2 = response.photos.photo[rand2].url_o;
          console.log(response.photos);
          console.log(src);

          if(src != null){
            // alert("not");
            $str = src;

        }else{
        	loadJsonpImg();
        }
        if(src2 != null){
            // alert("not");
            $str2 = src2;

        }else{
        	loadJsonpImg();
        }



    }
});
}

$(document).ready(function () {

	loadJsonpImg();

	firstImage();


	$("#searchButton").click(function () {
		document.location.href = "posts";
	});
	$(".signUpButton").click(function () {
		$('#darkScreen').fadeIn(500);
		$('#infos').show(400);
	});
	$('#darkScreen').click(function () {
		$('#darkScreen').fadeOut(200);
		$('#infos').hide();
	})
	$("#searchBox").keypress(function (e) {
		if (e.keyCode == 13) {
			$("#searchButton").click();
		}
	});

	$('.navbar a').each(function(index) {
		if(this.href.trim() == window.location)
			$(this).addClass("selected");
	});


});


