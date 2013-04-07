# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('ul.avatars li.avatar').bind 'click', (e) ->
    $('ul.avatars li.avatar').removeClass('selected')
    $(this).addClass('selected')
    $(this).find('input').attr('checked', true)
    
    $("select#cohort_cohort_id").change(-> $(this).closest("form").submit())
