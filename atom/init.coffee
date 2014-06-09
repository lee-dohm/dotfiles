# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#

# Settings to assign based on grammar name.
grammarSettings =
  'GitHub Markdown':
    softWrap: true
    tabLength: 4
  Java:
    tabLength: 4
  Python:
    tabLength: 4

# Apply the settings to the editor session.
#
# editor - Editor to which to apply the settings.
# settings - The settings to apply.
applySettingsForGrammar = (editor, settings) ->
  for key, value of settings
    switch key
      when 'softWrap' then editor.setSoftWrap(value)
      when 'tabLength' then editor.setTabLength(value)

# Apply grammar-specific settings.
#
# editor - Editor to which to apply the grammar-specific settings.
applySettings = (editor) ->
  settings = grammarSettings[editor.getGrammar().name]
  return unless settings?

  applySettingsForGrammar(editor, settings)

# Executes for each and every Editor, past and future.
atom.workspace.eachEditor (editor) ->
  applySettings(editor)

  editor.on 'grammar-changed', ->
    applySettings(editor)
