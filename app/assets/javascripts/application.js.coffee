#= require jquery
#= require jquery_ujs
#= require typed
#= require terminal
#= require_self

$ ->

  $('header h1 span').typed
    strings: ["Code, maniacs"]
    cursorChar: ""

  $('.terminal').terminal (c, t) ->
    switch c
      when "help"
        t.echo("command #{c}")
      when "cmd"
        $('footer').toggleClass('opened')
        false
      else
        t.error("Nope")
  ,
    greetings: "\nCode maniacs shell\nv1.23.001932812312 beta4\n\nWelcome!\nFor navigation please use commands, equivalent by menu pages words, for example type \"about\"\nType \"help\" for full commands list"
    keypress: (e) ->
      if (e.which == 96)
        false


  $('html').on 'keypress', (e) ->
    console.log e.keyCode
    if (e.keyCode == 96) or (e.keyCode == 20 and e.altKey and e.ctrlKey)
      e.preventDefault()
      e.stopPropagation()
      $('footer').toggleClass('opened')
      return false

  # about page

  aboutText = "def About\r\n"
  aboutText += "\tWe are Code maniacs!\r\n"
  aboutText += "end"

  $(document).on 'click', 'a', ->
    window.history.pushState({}, false, this.href)
    page = 'page' + this.pathname.replace('/', '.')
    $(document).trigger(page)
    #$('main').typed({strings: [aboutText]})
    console.log page
    false

  $(document).bind 'page.about', ->
    $('main').typed({strings: [aboutText], typingSpeed: 0})
    false



