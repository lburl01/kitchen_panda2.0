
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

$(function toggleAdd() {
  $("#toggle-add").on('click', function() {
     $("#add-item-toggle").toggle();
  })
})

$(function addForm() {
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
    var $items = $('#items-pantry')
    items.forEach(function(item) {
      if (item.is_deleted == false && item.location_id == 3 ) {
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

        $edit.on('click', function() {
          $("#add-item-toggle").toggle();
          $("#update-quantity").on('click', function updateQuantity() {
            var quantity = $('#quantity').val();

            $('#quantity').val('');

            return $.ajax({
              method: 'PUT',
              url: '/users/home/quantity/' + item.id,
              data: {
                quantity: quantity
              }
            })
          })
        })
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
    var $items = $('#items-freezer')
    items.forEach(function(item) {
      if (item.is_deleted == false && item.location_id == 1 ) {
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

        $edit.on('click', function() {
          $("#add-item-toggle").toggle();
          console.log(item.id);
          $("#update-quantity").on('click', function updateQuantity() {
            var quantity = $('#quantity').val();

            $('#quantity').val('');

            return $.ajax({
              method: 'PUT',
              url: '/users/home/quantity/' + item.id,
              data: {
                quantity: quantity
              }
            })
          })
        })
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
    var $items = $('#items-fridge')
    items.forEach(function(item) {
      if (item.is_deleted == false && item.location_id == 2 ) {
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

        $edit.on('click', function() {
          $("#add-item-toggle").toggle();
          $("#update-quantity").on('click', function updateQuantity() {
            var quantity = $('#quantity').val();

            $('#quantity').val('');

            return $.ajax({
              method: 'PUT',
              url: '/users/home/quantity/' + item.id,
              data: {
                quantity: quantity
              }
            })
          })
        })
      }
      })
    })
})
