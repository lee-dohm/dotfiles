path = require 'path'

# require('web-frame').setZoomFactor(1.15)

oldWindowDimensions = {}

atom.commands.add 'atom-workspace',
  'custom:open-todo-list': ->
    todoList = path.join(process.env.HOME, 'Dropbox/todo/todo.txt')
    atom.workspace.open(todoList)

  'custom:screenshot-prep': ->
    oldWindowDimensions = atom.getWindowDimensions()
    atom.setWindowDimensions('width': 1366, 'height': 768)

  'custom:screenshot-restore': ->
    atom.setWindowDimensions(oldWindowDimensions)

  'custom:throw-error': ->
    throw new Error
