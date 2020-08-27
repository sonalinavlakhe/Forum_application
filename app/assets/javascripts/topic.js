$(function(){

  $("#topic-comment").on("click", function(){
    $("#comment_comment").focus();
  });

  $("#closed_status").on("click", function(){
    debugger;
    var post_id = $(this).data("id");
    $.ajax({
      url: "/post/like/"+post_id,
      method: "GET"
      }).done(function(response){
        console.log(response);
      });
    })
  });