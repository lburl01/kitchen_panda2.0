
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

$(function() {
  $.ajax({
    method: 'GET',
    url: '/items',
    dataType: 'json'
  }).done(function(items) {
    var $items = $('#items')
    items.forEach(function(item) {
      if (item.is_deleted == false ) {
        var $p = $('<p>').appendTo($items)
        var $span = $('<span>').text(item.name + ": " + item.quantity).appendTo($p)
        var $edit = $('<button>').text("Edit").addClass('btn btn-default crud').appendTo($p)
        var $delete = $('<button>').text(" X ").addClass('btn btn-default delete crud').appendTo($p)

        $delete.click(function() {
          $p.remove();

          $.ajax({
            method: 'PUT',
            url: '/items/remove/' + item.id
          })
        })
      }
      })
    })
})
