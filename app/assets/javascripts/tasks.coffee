$('.draggable').draggable({
  cursor: 'move',
  snap: '.droppable',
  snapMode: 'inner',
  snapTolerance: 20,
  opacity: 0.7,
  revert: 'invalid',
  stack: '.task',
  start: (event, ui) ->
    handleStart(event, ui, this)
  stop: (event, ui) ->
    handleStop(event, ui, this)
})

handleStart = (event, ui, _this) ->
  $this = $(_this)
  ul_id = $this.parent('ul').attr('id')
  $li = $("<li class='droppable task'></li>")
  $li.height $this.outerHeight()
  $('ul[id!=' + ul_id + '][class="todos"]').append $li.clone()
  $('.droppable').droppable({
    drop: handleDrop
  })

handleDrop = (event, ui) ->
  $this = $(this)
  $task = $(ui.draggable)
  $ul = $this.parent('ul')
  $task.detach().css({top: 0,left: 0}).appendTo($ul)

  priority = switch $ul.attr('id')
    when 'starred' then 'high'
    when 'main' then 'normal'
    else 'low'

  $task.find('form .task_priority input').val priority

  $task.find('form').submit()

handleStop = (event, ui, _this) ->
  $('.droppable').remove()
