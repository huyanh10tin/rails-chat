$(document).ready(function() {
  if ($('#infinite-scrolling').size() > 0) {
    return $(window).on('scroll', function() {
      const more_posts_url = $('.pagination a.next_page').attr('href');
      if (more_posts_url && ($(window).scrollTop() > ($(document).height() - $(window).height() - 60))) {
            $('.pagination').html('<img id="loading" src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');
            $.getScript(more_posts_url);
          }
      return;
    });
  }




});
