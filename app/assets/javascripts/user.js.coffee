# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  # Event Listeners
  $('ul.avatars li.avatar').bind 'click', (e) ->
    $('ul.avatars li.avatar').removeClass('selected')
    $(this).addClass('selected')
    $(this).find('input').attr('checked', true)

  $('input.search-query').bind 'keyup', (e) ->
    phrase = $(this).val()
    $.ajax
      url: '/search'
      type: 'POST'
      data: {phrase: phrase}
      complete: (data, status, xhr) ->
        console.log(data.responseText)
