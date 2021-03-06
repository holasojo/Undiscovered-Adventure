<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Undiscovered Adventure</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/mapPage.css">

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/footer.css">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/navbar.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <!-- javascript -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
    </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>


    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


</head>

<body>
    <!-- navbar on top -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?= BASE_URL ?>/">Undiscovered Adventure</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="<?= BASE_URL ?>/feeds">Activity Feeds<span class="sr-only">(current)</span></a></li>
                    <li><a href="<?= BASE_URL ?>/posts">Posts </a></li>
                    <li class="active" ><a href="<?= BASE_URL ?>/mapPage">Map<span class="sr-only">(current)</span></a></li>
                    
                    <li><a href="<?= BASE_URL ?>/visualization">Visualization</a></li>

                </ul>

                <div id="login">
                    <?php include(dirname(__DIR__).'/view/sidebar.php'); ?>
                </div>



            </div>
        </div>
    </nav>

    <div class="contents">

        <!-- creating multiple posts in the left side of the screen -->
        <ul class ='posts'>
            <!-- getting all the variables using php from the database -->
            <?php
            foreach($posts as $post) {
            $author_id = $post->get('author_id');
            $author = AppUser::loadById($author_id);
            $author_name = $author->get('user_name');
            $postID = $post->get('id'); 
            $postTitle = $post->get('title');
            $postContent = $post->get('content');

            $stringCut = $postContent;
            if(strlen($postContent)>200){
            $stringCut = substr($postContent, 0, 300);
        }


        echo '

        <!-- actually "writing" in the html -->
        <!-- left side of the screen. shows posts -->
        <li class ="post">

            <h1 class ="title"> <a href="'.BASE_URL.'/posts/'.$postID.'">Title: '.$postTitle.'</a></h1> 
            <h3 class= "author"> <a href="'.BASE_URL.'/users/'.$author_name.'">By: '.$author_name.'</a></h3>

            <div class = "content">'.$stringCut.'...<a href="'.BASE_URL.'/posts/'.$postID.'">Read More</a></div>


        </li>
        ';

    }
    ?>

</ul>




<!-- Google map. On the right side -->

</div>
<div id="map"></div>
<!-- Initializing the map -->
<script>
  function initMap() {
    var mapDiv = document.getElementById('map');
    var map = new google.maps.Map(mapDiv, {
      center: {lat: 37.540, lng: 126.984355},
      zoom: 13
  });

// adding markers to the map 
//looping each post to get latitude and longitude
<?php foreach($posts as $post){ ?>

// getting the location for each post from the database 
var location = new google.maps.LatLng(<?php echo $post->get('latitude'); ?>, <?php echo $post->get('longitude'); ?>);

//initializing the infowindow and this will popup when the marker is clicked
var infowindow = new google.maps.InfoWindow({
});
    //initializing marker with the location
    var marker = new google.maps.Marker({
        position: location,
        map: map

    });
    //adding a listener to the marker so that it will have a popup
    google.maps.event.addListener(marker, 'click', function(){
        //will show title of each post when clicked.
        infowindow.setContent("<?php echo $post->get('title'); ?> ");
        infowindow.open(map, this);
    });

    <?php } ?>




}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key={key}&callback=initMap"></script>

<!-- footer -->

<footer>
    <div class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
          <div class="col-lg-4"></div>
          <div class="col-lg-4">
              <div class="navbar-collapse collapse" id="footer-body">
                <ul class="nav navbar-nav">
                  <li><a href="<?= BASE_URL ?>">Index</a></li>
                  <li>  <a href="<?= BASE_URL ?>/about">About</a></li>
                  <li>  <a href="<?= BASE_URL ?>/contact">Contact</a></li>
              </ul>
          </div>
      </div>
      <div class="col-lg-4"></div>
  </div>
</div>
</footer>
</body>

</html>
