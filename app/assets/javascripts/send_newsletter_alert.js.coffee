App.SendNewsletterAlert =
  initialize: ->
    $('#js-send-newsletter-alert').on 'click', ->
        confirm(this.dataset.alert);
    $('#js-cancel-newsletter-alert').on 'click', ->
        confirm(this.dataset.alert);
    $('#js-pause-newsletter-alert').on 'click', ->
        confirm(this.dataset.alert);
    $('#js-restart-newsletter-alert').on 'click', ->
        confirm(this.dataset.alert);
    $('.js-delete-newsletter-alert').on 'click', ->
        confirm(this.dataset.alert);
