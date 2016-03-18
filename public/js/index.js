/*jslint browser: true*/
/*global $, jQuery, alert*/

function firstImage() {};

function secondImage() {};

$(document).ready(function () {

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



var imgs = ["1.jpg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "7.jpeg"];

function firstImage() {
    var $ran = Math.floor(Math.random() * 7);
    $('#bg1').css({
        'background-image': 'url("./public/image/home_img/' + imgs[$ran] + '")'
    });

    $('#bg1').fadeIn(2000, function () {
        setTimeout("$('#bg1').fadeOut(3500); secondImage();", 8000);
    });
}

function secondImage() {
    var $ran2 = Math.floor(Math.random() * 7);
    $('#bg2').css({
        'background-image': 'url("./public/image/home_img/'+ imgs[$ran2] + '")'
    }).hide();

    $('#bg2').fadeIn(2000, function () {
        setTimeout("$('#bg2').fadeOut(3500); firstImage();", 8000);
    });

}



$(document).ready(function () {
    firstImage();
});