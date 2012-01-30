# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  names = $('#user_name').html()
  usernames = $('#user_username').html()
  emails = $('#user_email').html()
  
  $('#user_username').change ->
    username = $('#user_username :selected').text()
    id_selected = $('#user_username :selected').val()
    name = $(names).filter( -> $(this).val() == id_selected )
    email = $(emails).filter( -> $(this).val() == id_selected )    
    if name
      $('#user_name').val(id_selected)
    else
      $('#user_name').empty()
    if email
      $('#user_email').val(id_selected)
    else
      $('#user_email').empty()
      
  $('#user_name').change ->
    name = $('#user_name :selected').text()
    id_selected = $('#user_name :selected').val()
    username = $(usernames).filter( -> $(this).val() == id_selected )
    email = $(emails).filter( -> $(this).val() == id_selected )    
    if username
      $('#user_username').val(id_selected)
    else
      $('#user_username').empty()
    if email
      $('#user_email').val(id_selected)
    else
      $('#user_email').empty()

  $('#user_email').change ->
    email = $('#user_email :selected').text()
    id_selected = $('#user_email :selected').val()
    name = $(names).filter( -> $(this).val() == id_selected )
    username = $(usernames).filter( -> $(this).val() == id_selected )
    if name
      $('#user_name').val(id_selected)
    else
      $('#user_name').empty()
    if username
      $('#user_username').val(id_selected)
    else
      $('#user_username').empty()   
