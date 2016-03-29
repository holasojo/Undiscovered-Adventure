	function ajaxLike(id) {
		  $.ajax({
			   type: "POST",
			   url: './../app/view/like.php',
			   data:{action:'like', idOption: id},
			   success:function(html) {
				 alert("Thank you for liking!");
			   }

		  });
	 }