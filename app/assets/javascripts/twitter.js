jQuery.fn.exists = function(){return this.length>0;}

if(!String.linkify) {
  String.prototype.linkify = function() {

    // http://, https://, ftp://
    var urlPattern = /\b(?:https?|ftp):\/\/[a-z0-9-+&@#\/%?=~_|!:,.;]*[a-z0-9-+&@#\/%=~_|]/gim;

    // www. sans http:// or https://
    var pseudoUrlPattern = /(^|[^\/])(www\.[\S]+(\b|$))/gim;

    // Email addresses *** here I've changed the expression ***
    var emailAddressPattern = /(([a-zA-Z0-9_\-\.]+)@[a-zA-Z_]+?(?:\.[a-zA-Z]{2,6}))+/gim;

    return this
    .replace(urlPattern, '<a target="_blank" href="$&">$&</a>')
    .replace(pseudoUrlPattern, '$1<a target="_blank" href="http://$2">$2</a>')
    .replace(emailAddressPattern, '<a target="_blank" href="mailto:$1">$1</a>');
  };
}

function format(s) {
  var sanitized = s.replace(/&(?!\w+([;\s]|$))/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
  var linkified = sanitized.linkify();
  var formatted = linkified.replace(/(\s|^)@([A-Za-z0-9_]+)/g, "<a href='http://www.twitter.com/$2'> @$2</a>");
  return formatted;
}

function getTwitterFeed() {
  $.getJSON('http://search.twitter.com/search.json?q=%23spp%20%40studpeaceprize&callback=?', function(feed) {
    var twitterbox = $("#twitter-box");
    twitterbox.empty();
    twitterbox.append('<h1>Twitter</h1>');
    feed.results.forEach(function(item) {
      var id = "twitter-result"+item.id_str;
      twitterbox.append('<div class="item" id="'+ id +'"></div>');
      var itembox = $('#'+id);
      itembox.append('<img src="'+item.profile_image_url+'" class="twitpic pull-left" height="30px" width="30px"/>');
      itembox.append('<p>'+ format(item.text) +'</p>');
      itembox.append('<small class="pull-right">'+item.from_user_name+' @'+item.from_user+'.</small>');
    });
    $('#twitter-box div:first').addClass('active');
  });
}

function cycleTwitter() {
  var active_twitter = $('#twitter-box div.active');
  active_twitter.fadeOut(1000,function() {
    $(this).removeClass('active').removeAttr("style");
    var next_twitter = active_twitter.next();
    if (!next_twitter.exists()) {
      next_twitter = $('#twitter-box div:first');
    }
    next_twitter.fadeIn(1000,function() {
      $(this).addClass('active');
    });

  });
}

$(function() {
  getTwitterFeed();
  setInterval(cycleTwitter,5*1000);
});
