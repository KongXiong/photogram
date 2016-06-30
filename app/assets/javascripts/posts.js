var loadFile = function(event) {  
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};

$('#posts').append("<%= j (render 'posts')%>");
$('#paginator').html("<%= j (link_to_next_page(@posts, 'LOAD MORE', remote: true, id: 'load_more'))%>");
if (!$('#load_more').length) { $('#paginator').remove(); }  