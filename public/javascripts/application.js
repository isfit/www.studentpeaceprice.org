// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  $('#photo').imgAreaSelect({
    handles: true,
  });
});

function preview(img, selection) {
  var scaleX = 100 / (selection.width || 1);
  var scaleY = 100 / (selection.height || 1);

  $('#ferret + div > img').css({
    width: Math.round(scaleX * 400) + 'px',
    height: Math.round(scaleY * 300) + 'px',
    marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px',
    marginTop: '-' + Math.round(scaleY * selection.y1) + 'px'
  });
}

$(function() {
  $('<div><img src="/images/img.png" style="position: relative;" /></div>')
    .css({
      float: 'left',
      position: 'relative',
      overflow: 'hidden',
      width: '100px',
      height: '100px'
    }).insertAfter($('#ferret'));

    $('#ferret').imgAreaSelect({ aspectRatio: '1:1', onSelectChange: preview });
  });
