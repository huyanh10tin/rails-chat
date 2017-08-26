$(document).on("turbolinks:load", function() {
  $(window).on('scroll', function() {
    const more_posts_url = $('.pagination span.next a[rel="next"]').attr('href');
    if (more_posts_url && ($(window).scrollTop() > ($(document).height() - $(window).height() - 60))) {
      $('.pagination').html('<img id="loading" src="/assets/loading.gif" alt="Loading..." title="Loading..." />');

      $.getScript(more_posts_url)
      .done(function(){
      })
      .fail(function() {
        $("#loading").hide();
      })
    }
    return;
  });
});
