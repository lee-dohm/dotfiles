# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#

path = require 'path'

oldWindowDimensions = {}
oldThemes = []

atom.commands.add 'atom-workspace',
  'custom:open-todo-list': ->
    todoList = path.join(process.env.HOME, 'Dropbox', 'todo', 'todo.txt')
    atom.workspace.open(todoList)

atom.workspaceView.command 'custom:screenshot-prep', ->
  oldWindowDimensions = atom.getWindowDimensions()
  oldThemes = atom.config.get('core.themes')

  atom.setWindowDimensions
    'width': 1024
    'height': 768
  atom.config.restoreDefault('core.themes')

atom.workspaceView.command 'custom:screenshot-restore', ->
  atom.config.set('core.themes', oldThemes)
  atom.setWindowDimensions(oldWindowDimensions)
