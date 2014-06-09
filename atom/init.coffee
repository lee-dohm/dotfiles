# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#

fileTypes = {
  "source.gfm": (editor) ->
    editor.setSoftWrap(true)
    editor.setTabLength(4)

  "source.java": (editor) ->
    editor.setTabLength(4)

  "source.python": (editor) ->
    editor.setTabLength(4)
}

# Apply grammar-specific settings.
#
# editor - Editor to which to apply the grammar-specific settings.
applySyntaxSettings = (editor) ->
  func(editor) for scopeRegex, func of fileTypes when scopeRegex.test(editor.getGrammar().scopeName)

# Executes for each and every Editor, past and future.
atom.workspace.eachEditor (editor) ->
  applySyntaxSettings(editor)

  editor.on 'grammar-changed', ->
    applySyntaxSettings(editor)
