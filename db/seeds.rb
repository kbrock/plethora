Word.find_or_create_by(root: 'plethora', text: 'plethora')
Word.find_or_create_by(root: 'plethora', text: 'plentiful')

Sentence.find_or_create_by(text: "Would you say I have %<plethora>a of pinatas?")
