# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  inventories = $('#inventory_item_inventory_id').html()
  $('#inventory_item_inventory_type_id').change ->
    inventory_type = $('#inventory_item_inventory_type_id :selected').text()
    options = $(inventories).filter("optgroup[label=#{inventory_type}]").html()
    console.log(options)
    if options
      $('#inventory_item_inventory_id ').html(options)
    else
      $('#inventory_item_inventory_id ').empty()