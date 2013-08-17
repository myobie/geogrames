class @MapColumnView extends Backbone.View
  template: JST["templates/map_column"]

  events:
    'submit nav form': 'submit'
    'click nav span.link': 'locate'

  locate: ->
    console.log 'later'

  submit: (e) ->
    e.preventDefault()
    q = @$('nav input').val()
    @mapView.search q

  initialize: ->
    @mapView = new MapView

  render: ->
    @$el.html @template @
    @mapView.setElement @$('.map')
    @mapView.render()
    @
