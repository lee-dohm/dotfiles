# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#

path = require 'path'

oldWindowDimensions = {}

atom.commands.add 'atom-workspace',
  'custom:open-todo-list': ->
    todoList = path.join(process.env.HOME, 'Dropbox', 'todo', 'todo.txt')
    atom.workspace.open(todoList)

  'custom:screenshot-prep': ->
    oldWindowDimensions = atom.getWindowDimensions()
    atom.setWindowDimensions('width': 1366, 'height': 768)

  'custom:screenshot-restore': ->
    atom.setWindowDimensions(oldWindowDimensions)
