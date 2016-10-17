
$(function() {
  $('#freezer').on('click', function() {
    window.location.href = "/users/freezer";
  })
})

$(function() {
  $('#fridge').on('click', function() {
    window.location.href = "/users/fridge";
  })
})

$(function() {
  $('#pantry').on('click', function() {
    window.location.href = "/users/pantry";
  })
})

$(function() {
  $("#toggle-add").on('click', function() {
     $("#add-item-toggle").toggle();
  })
})

$(function() {
  $("#add-item").on('click', function createItem() {
    var name = $('#itemName').val();
    var quantity = $('#quantity').val();
    var location_id = $('[name=location]:checked').val();

    $('#itemName').val('');
    $('#quantity').val('');

    return $.ajax({
      method: 'POST',
      url: '/users/home',
      data: {
        location_id: location_id,
        name: name,
        quantity: quantity
      }
    })
  })
})

// $(function() {
//   (function(item) {
//       console.log(item.name);
//       var remove = $('#remove-' + item.name)
//       $(remove).on('click', function() {
//         console.log('hi mom');
//         $("p").remove(":contains(item.name)");
//
//         // $.ajax({
//         //   method: 'PATCH',
//         //   url: '/items/remove' + item.name
//         // })
//       })
//     })
//   })
// })
