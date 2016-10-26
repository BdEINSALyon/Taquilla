
$ ->

  # load a language
  numeral.language 'fr',
    delimiters:
      thousands: ' '
      decimal: ','
    abbreviations:
      thousand: 'k'
      million: 'm'
      billion: 'b'
      trillion: 't'
    ordinal: (number) ->
      if number == 1 then 'er' else 'ème'
    currency: symbol: '€'
  # switch between languages
  numeral.language 'fr'

  computePrice = ->
    $('.table-cart').each ->
      $this = $(this)
      price = 0.0;
      tickets = {}
      $this.find('.line-pass').each ->
        $pass = $(this)
        tickets[$pass.data 'id'] = parseInt($pass.find('.pass-count').val())
        price += parseFloat($pass.data('price')) * parseFloat($pass.find('.pass-count').val())
      $this.find('.price').html(numeral(price).format('0,0.00')+' €');
      console.log(tickets);

  $('.table-cart .pass-count').on('change', computePrice)

  computePrice()