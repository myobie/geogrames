class @MapView extends Backbone.View
  center: (latlng) ->
    @map.panTo latlng

  moveMarker: (latlng) ->
    @marker.setLatLng latlng
    @center latlng
    @moved latlng

  moved: (latlng) ->
    console.log "The marker is now at", latlng

  setupMap: ->
    if @map
      @map
    else
      @map = L.mapbox.map @el, map_id
      @map.setView [37.9, -77], 6
      @map

  setupMarker: ->
    if @marker
      @marker
    else
      center = @map.getCenter()

      geoJSON =
        type: 'Feature'
        geometry:
          type: 'Point'
          coordinates: [center.lng, center.lat]
        properties:
          title: "Drag me around"
          description: "Then I'll reload the images"
          'marker-color': 'CC0033'

      @map.markerLayer.on "mouseover", (e) =>
        unless @alreadyShown
          e.layer.openPopup()
          @alreadyShown = true

      @map.markerLayer.on "mouseout", (e) =>
        e.layer.closePopup()

      @map.markerLayer.on "layeradd", (e) =>
        @marker = e.layer
        @marker.dragging.enable()
        @marker.on "dragend", (e) =>
          latlng = @marker.getLatLng()
          @center latlng
          @moved latlng

      @map.markerLayer.setGeoJSON geoJSON

      @marker

  setElement: (element) ->
    @map = null
    @marker = null
    super

  search: (q) =>
    coder = L.mapbox.geocoder map_id
    coder.query q, @finishSearch

  finishSearch: (error, result) =>
    if error
      # do something
    else
      @moveMarker result.latlng

  render: ->
    @setupMap()
    @setupMarker()
    @
