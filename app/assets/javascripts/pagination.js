function grabButtons() {
  // grab comment buttons
  $("div.post").on("click", ".js-comment-button", (e) => {
    e.preventDefault();

    $(e.target).parents("[id*=post_]").find("input.input").focus();
  })

  // grab reply buttons
  $("div.comment").on("click", "a[id*='js-reply-comment']", (e) => {
    e.preventDefault();

    $parent = $(e.target).parents("div.comment")
    $parent.find(".js-reply-comment").last().toggleClass("hidden").find("input").focus().on("focusout", function(){
      console.log("test")
    })

    $parent.find("div.replies").toggleClass("hidden");
  })
}

$(document).on("turbolinks:load", function() {
  grabButtons();
  $(window).on('scroll', function() {
    const more_posts_url = $('.pagination span.next a[rel="next"]').attr('href');
    if (more_posts_url && ($(window).scrollTop() > ($(document).height() - $(window).height() - 60))) {
      $('.pagination').html('<img id="loading" src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');

      // Updates posts with infinite pagination
      $.getScript(more_posts_url)
        .done(function(){
          console.log("Reached bottom");
          grabButtons();
        })
        .fail(function() {
          $("#loading").hide();
        })
    }
    return;
  });
});
