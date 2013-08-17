#= require zepto
#= require underscore
#= require backbone
#= require_tree .

class Router extends Backbone.Router
  routes:
    "": "home"

  home: ->
    @render(new MapColumnView)

  render: (view) ->
    @currentView?.remove()
    view.setElement document.getElementById("content")
    @currentView = view.render()
    @

@router = new Router

Backbone.history.start root: "/map"
