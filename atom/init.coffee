# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#

fileMasks = {
  "\\.md$": (editorView) ->
    editor = editorView.getEditor()
    editor.setSoftWrap(true)
    editor.setTabLength(4)

  "\\.py$": (editorView) ->
    editor = editorView.getEditor()
    editor.setTabLength(4)
}

applySyntaxSettings = (editorView) ->
  editor = editorView.getEditor()
  func(editorView) for regex, func of fileMasks when new RegExp(regex).test(editor.getPath())

atom.workspaceView.eachEditorView (editorView) ->
  applySyntaxSettings(editorView)

  editorView.getEditor().on 'grammar-changed', ->
    applySyntaxSettings(editorView)
