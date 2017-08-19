$(document).ready(function() {
  if ($('#infinite-scrolling').size() > 0) {
    return $(window).on('scroll', function() {
      const more_posts_url = $('.pagination span.next a[rel="next"]').attr('href');
      if (more_posts_url && ($(window).scrollTop() > ($(document).height() - $(window).height() - 60))) {
            $('.pagination').html('<img id="loading" src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');
            $.getScript(more_posts_url)
              .fail(function() {
                $("#loading").hide();
              })
          }
      return;
    });

    // close #infinite scrolling
  }
  // close document ready
});
