#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->

  $(document).on 'click', 'a', ->
    window.history.pushState({}, false, this.href)
    page = 'page' + this.pathname.replace('/', '.')
    $(document).trigger(page)
    console.log page
    false

  # about page

  aboutText = "def About\r\n"
  aboutText += "\tWe are Code maniacs!\r\n"
  aboutText += "end"

  $(document).bind 'page.about', ->
    $('main').html(aboutText)



