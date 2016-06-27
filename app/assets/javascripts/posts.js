var loadFile = function(event) {  
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};

$('#users').html('<%= escape_javascript render(@users) %>');
$('#paginator').html('<%= escape_javascript(paginate(@users, :remote => true).to_s) %>');