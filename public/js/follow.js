


  function followUser(logged_user, followThisUser) {
      
      $.ajax({
        type: "POST",
        url: './../app/model/follow.php',
        data: {action: 'follow', logged_user: logged_user, followThisUser: followThisUser},
     
        success: function(data) {

        },
        error:function(){
          alert("no");
        }
    });

   }

