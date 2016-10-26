
$ ->

  computePrice = ->
    $('.table-cart').each ->
      $this = $(this)
      price = 0.0;
      $this.find('.line-pass').each ->
        $pass = $(this)
        price += parseFloat($pass.data('price')) * parseInt($pass.find('.pass-count').val())
      $this.find('.price').html(price+' €');

  $('.table-cart .pass-count').on('change', computePrice)

  computePrice()