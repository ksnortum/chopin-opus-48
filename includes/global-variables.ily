\version "2.24.0"

%
% Scheme functions
%

dimRall =
  #(make-music 'DecrescendoEvent 'span-direction START 'span-type 'text
               'span-text "dim.     rall.")

%
% Redefine
%

staffUp   = \change Staff = "upper"
staffDown = \change Staff = "lower"

sd = \sustainOn
su = \sustainOff

hideNoteHead = \once {
  \omit Stem
  \omit Dots
  \omit Flag
  \hideNotes
  \override NoteColumn.ignore-collision = ##t
}

tupletOff = {
  \omit TupletNumber
  \omit TupletBracket
}
tupletOn = {
  \undo \omit TupletNumber
  \undo \omit TupletBracket
}

connectArpeggios = \set Score.connectArpeggios = ##t
disconnectArpeggios = \set Score.connectArpeggios = ##f
tieToNextNote = \set tieWaitForNote = ##t

%
% Markup
%

mezzaVoce = \markup \large \italic "mezza voce"
sottoVoce = \markup \large \italic "sotto voce"
doppoiMovimento = \markup \large \italic "doppio movimento"
aTempo = \markup \large \italic "a tempo"
pocoRitenuto = \markup \large \italic "poco ritenuto"
ten = \markup \large \italic ten.
rit = \markup \large \italic rit.
rall = \markup \large \italic rall.
riten = \markup \large \italic riten.
accel = \markup \large \italic accel.
crescMarkup = \markup \large \italic cresc.
ritenuto = \markup \large \italic ritenuto
stretto = \markup \large \italic stretto
smorz = \markup \large \italic smorz.
sempreP = 
  \markup \whiteout \pad-markup #0.5 { \large \italic sempre \dynamic p }
sempreFf = \markup { \large \italic sempre \dynamic ff }
ppAgitato = \markup { \dynamic pp \large \italic agitato }
trillSharp = \markup \teeny \sharp
