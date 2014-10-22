# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#

oldWindowDimensions = {}
oldThemes = []

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
