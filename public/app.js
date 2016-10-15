console.log('hi dad');

$(function() {
  $('#freezer').on('click', function() {
    console.log('hi mom');
    window.location.href = "/users/freezer";
  })
})

$(function() {
  $('#fridge').on('click', function() {
    console.log('hi mom');
    window.location.href = "/users/fridge";
  })
})

$(function() {
  $('#pantry').on('click', function() {
    console.log('hi mom');
    window.location.href = "/users/pantry";
  })
})
