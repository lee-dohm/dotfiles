# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#

# Settings to assign based on grammar name.
grammarSettings =
  'GitHub Markdown':
    showInvisibles: false
    softWrap: true
    tabLength: 4
  Java:
    tabLength: 4
  Python:
    tabLength: 4
  'Shell Script (Bash)':
    tabLength: 4

# Apply the settings to the editor session.
#
# editorView - EditorView to which to apply the settings.
# settings   - The settings to apply.
applySettingsForGrammar = (editorView, settings) ->
  editor = editorView.getEditor()
  for key, value of settings
    switch key
      when 'showInvisibles' then editorView.setShowInvisibles(value)
      when 'softWrap' then editor.setSoftWrap(value)
      when 'tabLength' then editor.setTabLength(value)

# Apply grammar-specific settings.
#
# editorView - EditorView to which to apply the grammar-specific settings.
applySettings = (editorView) ->
  settings = grammarSettings[editorView.getEditor().getGrammar().name]
  return unless settings?

  applySettingsForGrammar(editorView, settings)

# Executes for each and every EditorView, past and future.
atom.workspaceView.eachEditorView (editorView) ->
  applySettings(editorView)

  editorView.getEditor().on 'grammar-changed', ->
    applySettings(editorView)
