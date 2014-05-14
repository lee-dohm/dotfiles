# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#

{$} = require 'atom'
path = require 'path'

fileMasks = {
  "\\.md$": (editor) ->
    editor.setSoftWrap(true)
    editor.setTabLength(4)

  "\\.py$": (editor) ->
    editor.setTabLength(4)
}

atom.workspaceView.eachEditorView (editorView) ->
  editor = editorView.getEditor()
  func(editor) for regex, func of fileMasks when new RegExp(regex).test(editor.getPath())
