# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#

fileTypes = {
  "GitHub Markdown": (editor) ->
    editor.setSoftWrap(true)
    editor.setTabLength(4)

  "Java": (editor) ->
    editor.setTabLength(4)

  "Python": (editor) ->
    editor.setTabLength(4)
}

# Apply grammar-specific settings.
#
# editor - Editor to which to apply the grammar-specific settings.
applySyntaxSettings = (editor) ->
  func(editor) for name, func of fileTypes when name is editor.getGrammar().name

# Executes for each and every Editor, past and future.
atom.workspace.eachEditor (editor) ->
  applySyntaxSettings(editor)

  editor.on 'grammar-changed', ->
    applySyntaxSettings(editor)
