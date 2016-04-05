$('.draggable').draggable({
  # containment: '.droppable',
  cursor: 'move',
  snap: '.droppable',
  opacity: 0.7,
  revert: 'invalid',
})
$('.droppable').droppable({
  drop: (event, ui) ->
    console.log('Dropped!')
})
