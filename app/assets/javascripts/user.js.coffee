# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  # Event Listeners
  $('ul.avatars li.avatar').bind 'click', (e) ->
    $('ul.avatars li.avatar').removeClass('selected')
    $(this).addClass('selected')
    $(this).find('input').attr('checked', true)
    
  $("select#cohort_cohort_id").change(-> $(this).closest("form").submit())

  $('input.search-query').bind 'keyup', (e) ->
    phrase = $(this).val()
    $.ajax
      url: '/search'
      type: 'POST'
      data: {phrase: phrase}
      complete: (data, status, xhr) ->
        console.log(data.responseText)

  $('.cohort_img').change ->
    id = $(this).val()
    show_cohort(id)

  show_cohort = (id) ->
    $('ul.avatars li').hide()
    $('ul.avatars li.cohort_' + id).show()

  show_cohort($('.cohort_img').val())
