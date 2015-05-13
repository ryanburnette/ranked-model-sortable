#= require jquery-ui/sortable
jQuery(document).ready ($) ->

  $("[data-ranked-model-sortable]").each ->

    $sortable = $(this)
    rms       = "ranked-model-sortable"
    model     = $sortable.data("#{rms}-model")
    attribute = $sortable.data("#{rms}-attribute")
    $handle   = $sortable.find("[data-#{rms}-handle]")
    base_post_url = $sortable.data("#{rms}-base-post-url")

    post_url = (i) ->
      "#{base_post_url}/#{i}"

    get_data = (index) ->
      obj = {}
      obj["_method"] = "PATCH"
      obj["#{model}[#{attribute}]"] = index
      obj

    csrf_token = ->
      $("meta[name='csrf-token']").attr("content")

    set_request_header = (jqxhr) ->
      jqxhr.setRequestHeader "X-CSRF-Token", csrf_token()

    stop = (e, ui) ->
      id = ui.item.data("#{rms}-id")
      index = ui.item.index()

      jqxhr = $.ajax
        type: "POST"
        beforeSend: set_request_header
        url: post_url(id)
        data: get_data(index)

      jqxhr.fail ->
        $sortable.sortable "cancel"

    $sortable.sortable
      handle: $handle
      stop: stop
