%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 2) (0 . 2))
                        ((0 . 0) (0 . -1) (0 . 0) (0 . 0))
                        ) \etc
slurShapeB = \shape #'(
                        ((0 . 0.5) (0 . 0.5) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeC = \shape #'(
                        ((0 . 3) (0 . 3) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 1))
                        ) \etc
slurShapeD = \shape #'((0 . -1) (0 . -1) (0 . 0) (0 . 0)) \etc
slurShapeE = \shape #'(
                        ((0 . 3) (3 . 3) (0 . 0) (0 . 0.5))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeF = \shape #'((0 . 1) (0 . 3.5) (0 . 1) (0 . 0)) \etc
slurShapeG = \shape #'((0 . 1) (0 . 3.5) (0 . 1) (0 . 0)) \etc
slurShapeH = \shape #'(
                        ((0 . 3) (0 . 1.5) (0 . -1.5) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeI = \shape #'((0 . -0.5) (0 . 2) (0 . 0) (0 . 0)) \etc
slurShapeJ = \shape #'((0 . 3) (0 . 3) (0 . 2.5) (0 . 2)) \etc
slurShapeK = \shape #'((0 . 2.5) (0 . 2.5) (0 . 2) (0 . 1)) \etc

tieShapeA = \shape #'((1.5 . 0.5) (2 . 0) (0 . 0) (0 . 0)) \etc

clefSpaceA = \once \override Score.Clef.X-extent = #'(-1 . 2.5)
clefSpaceB = \once \override Score.Clef.X-extent = #'(-0.25 . 1.5)
clefSpaceC = \once \override Score.Clef.X-extent = #'(1 . 1.5)

beamPositionsA = \once \override Beam.positions = #'(4 . 3)
beamPositionsB = \once \override Beam.positions = #'(3.5 . 4)
beamPositionsC = \once \override Beam.positions = #'(4 . 3)
beamPositionsD = \override Beam.positions = #'(4 . 4)
beamPositionsOff = \revert Beam.positions

%%% Music %%%

global = {
  \time 4/4
  \key c \minor
}

rightHandUpper = \relative {
  r4 g'' r af |
  r8 g4-\slurShapeA ( d8~  d16 ef f ef  d ef f g |
  c,4 c8. c16 d4 c8. af16 |
  g4~ \beamPositionsA g16 \slashedGrace { bf8*1/2 } af16 g d  ef c) r8 r4 |
  r4 g'' r af~-\slurShapeB \( |
  af8 g4 f8~ f16[ ef f \grace { ef16 f } ef]  d ef f g |
  d8 d,~ d16 g c d  ef4.. fs,16 |
  fs4.~( \beamPositionsB fs32 g bf a  g4)\) r |
  
  \barNumberCheck 9
  r4 af~-\slurShapeC ( af8 df f bf |
  af4.~ \grace { af8*1/2 gf, af ef' } \tuplet 3/2 { af16 gf f }
    \grace { << { f,16*1/2[ af df] } \\ { f,4*1/8 } >> } f'4) r |
  r4 g,( \grace { af16 bf } af g b c  d ef c' af |
  g4~ \tuplet 6/4 { g16 cs, d g f ef } ef4) r |
  r4 b4~( b8 c d ef) |
  r4 d~( d8 ef f g |
  g8 f af c,  d[ ef \grace { ef8*1/2 f ef d ef } g8 f] |
  d2) r |
  
  \barNumberCheck 17
  r4 \voiceOne g \oneVoice r \voiceOne af |
  \oneVoice r8 g4-\slurShapeD ( f8~ f16[ ef f \grace { ef f } ef]  d ef f g |
  \slashedGrace { g8*1/2 } c,2) r4 f( |
  \slashedGrace { b,8 } ef4. d8~ d16[ c d \grace { c16*1/2 d } c16]  b! c d
    ef |
  g,4-.) c'~( c16 b bf a  af f af,! df~ |
  \stemDown <e, df'>16[ c' \slashedGrace { ef!8*1/2 } df16 c]  ds e af g
    f, c' f g  bf af c, d |
  \stemNeutral ef!4) r8 \tuplet 3/2 { c16( d c } g4)->^\ten r8 
    \tuplet 3/2 { g16( af g } |
  c,1->~)^\ten | 
  \bar "||"
  \key c \major
  
  \barNumberCheck 25
  \voiceOne <c e>2( d4 e8. f16 |
  <c e>4) \staffDown <e, g>-\slurShapeE ( <e c'> \staffUp <c' e>4 | 
  <c g'>2 <c e>4 \staffDown \slashedGrace { e8 } <e, a d>8. <e a c>16~ |
  <d fs a c d>2 <d g b d>4 \staffUp <ds' f g>4 |
  \oneVoice <e g e'>2 <d! g d'!>4 <e g e'>8 <f g b f'> |
  \connectArpeggios <e g c e>4\arpeggio <g, c e g> <c e a c> 
    \disconnectArpeggios <e g b e>\arpeggio |
  <e g c e g>2\arpeggio <e gs b e>4 <c d a' d>8[) r16 <b f' g>16]( |
  \slashedGrace { b8*1/2 } <b f' g d'>2 <c e c'>)\arpeggio |
  
  \barNumberCheck 33
  <a' c a'>2( <g c g'>4 <g a c a'> |
  <fs a d fs>4 <c d a' d>8. <d as' d>16 <d b' d>4 <d fs d'> |
  <b' d b'>2\arpeggio <a d a'>4 <a b ds b'> |
  <gs b e gs>2 <g b e g>4 \voiceFour <f g g'> |
  \oneVoice <e c' e g>2\arpeggio <f g b d g>4 <f g b e g>8 < f g b f' g> |
  <e c' e g>4) <g, c e g>( <c e a c> <e g c e> |
  <g c e g>8)\noBeam \tupletOff \tuplet 3/2 8 { <fs, fs'>16^>( <g g'> q
    q[ <af af'> q]  q <g g'> q) } <e' g e'>4( <d g d'>8 <g, b f' g> |
  <d' f g d'>8)\noBeam \tuplet 3/2 8 { <fs, fs'>16( <g g'> q  <gs gs'>[ <a a'>
    q]  <as as'> <b b'> q } <c e c'>2 |
  
  \barNumberCheck 41
  <a' c a'>8)\noBeam \tuplet 3/2 8 { <b, b'>16( <c c'> q  q[ <cs cs'> q] 
    q <d d'> <ef ef'> } <g c ef! g>8)\noBeam \tuplet 3/2 8 { 
    <c, c'>16^( <cs cs'> q  q[ <d d'> q]  \stemUp q <ef! ef'!> <g a c a'>) } |
  \stemNeutral <fs a d fs>8\noBeam \tuplet 3/2 8 { <cs cs'>16( <d d'> q  q[ 
    <ds ds'> q]  q[ <e e'> q]  q[ <f f'> q]  q[ <fs fs'> q]  q[ <g g'> 
    <gs gs'>]  q[ <a a'> <as as'>] } |
  <b d b'>8)\noBeam \tuplet 3/2 8 { <cs, cs'>16^( <d d'> q  q[ <ds ds'> q] 
    q <e e'> <f f'>) } <a b d a'>8\noBeam \tuplet 3/2 8 { <d, d'>16( <ds ds'>
    q  q[ <e e'> q]  q <f f'> <a b d b'>) } |
  <gs b e gs>8\noBeam \tuplet 3/2 8 { <ds ds'>16( <e e'> q  q[ <f f'> q] q[ 
    <fs fs'> q]  q[ <g g'> q]  q[ <g f' g> q]  q[ q q]  <g b f' g>[ q q]) } |
  <e' g e'>8\noBeam \staffDown \voiceOne \grace { fs,,16 g } \afterGrace 
    g4.->\startTrillSpan { fs16\stopTrillSpan g } \staffUp \oneVoice
    <e'' g e'>8( <d g d'> <e g e'> <f g b f'> |
  \tupletOn \tuplet 3/2 { <e g c e>16) \ottava 1 <c' c'>[ <d d'>] }
    \tupletOff \tuplet 3/2 8 { 
      <c c'>->[ <g g'> <a a'>] <g g'>->[ <e e'> <f f'>]  \ottava 0 <e e'>->[
      <c c'> <d d'>]  <c c'>->[ <g g'> <a a'>]  <g g'>->[ <e e'> <f f'>]
      <e e'>->[ <c c'> <d d'>]  <c c'>->[ <a a'>-> <e e'>->] 
    } |
  \tuplet 3/2 8 {
    <g c e g>16 <ef'' ef'>[ <d d'>]  <cs cs'>[ <c c'> <b b'>]  <bf bf'>[ <a a'>
    <gs gs'>]  <g g'>[ <fs fs'> <f f'>]  
  } <e' gs e'>4( <d f d'>8 <f, g! d' g>) |
  <d' f g b d>8\noBeam \tuplet 3/2 8 { \ottava 1 <e' e'>16[ <d d'> <a a'>]
    <g g'>[ <e e'> <d d'>]  \ottava 0 <a a'>[ <g g'> <g, b f' g>]
  } <c e c'>4 r |  
  
  \barNumberCheck 49
  \bar "||"
  \key c \minor 
  \voiceOne s4^\doppoiMovimento g'' a\rest af
  \tuplet 3/2 4 { s4 g4 s8 d~ } \hideNoteHead d4 s |
  c4( c8. <ef, af c>16 d'4 \tuplet 3/2 { c8*2~[ c16 <c, d af'>] } |
  g'4 \beamPositionsC <b, d f g>16 \grace { bf'!8 } <b,! d f af>16 <b d f g> d
    \tuplet 3/2 4 { ef c) s4 } s4 | 
  s4 g'' a\rest af~ |
  af8 g4 f8~ \hideNoteHead f4 s |
  \tuplet 3/2 { <bf, d>8*2( d,8->~ } d16 <d g> <d g c> <d g d'>  ef'4~ ef8
    fs,) |
  \tuplet 3/2 { fs4 g8~ } g2 g4->~-\slurShapeH ( |
  
  \barNumberCheck 57
  g!4 af~ \tuplet 3/2 { af8*2[ df8 f8*2 bf8] } |
  af4~ \tuplet 3/2 { af4 gf16 <gf, af f'> } f'2~ |
  f4) g,->  \oneVoice <ef af>16-.-\slurShapeI ( <ef g>-. <ef g b>-. <ef g c>-.
    <ef g c d>-. <g c ef>-. <c ef c'>-. <c ef af>-. |
  \voiceOne g'4->~ \tuplet 3/2 { g16 cs,-. d-. g-. f-. ef-. } ef8-> s4. |
  r4 b->~ \tuplet 3/2 { b8*2[ c8 d8*2 ef8]) } |
  r4 d->~( \tuplet 3/2 { d8*2[ ef8 f8*2 g8]} |
  \tuplet 3/2 { g8*2[ f8 af8*2 c,8]  d8*2 ef8 } \oneVoice \tupletOn 
    \tuplet 7/4 { <af, c ef>16-. <af c f>-. <af c ef>-. <af c d>-. <af c ef>-.
    <af c ef g>-. <af c ef f>-.
  } |
  \tupletOff
  << 
    { \tuplet 3/2 { s2. s4. s4 \hideNoteHead g8) } } 
    \new Voice { \voiceOne d'1-> } 
  >> |
  
  \barNumberCheck 65
  s4 \voiceOne g a\rest af 
  \tuplet 3/2 { s4 g s8 f~ } \hideNoteHead f4 s |
  \slashedGrace { <g, c g'>8 } \tuplet 3/2 4 { c4*3/2  c8*2( c8  c4*3/2 f8*2 
    ef8 } |
  \tuplet 3/2 4 { ef4*3/2~ ef8*2 d8~ } \oneVoice <ef, af d>16 <ef af c>-.
    <ef af d>-. <ef af c>-.  <ef af b>-. <ef af c>-. <ef af d>-. 
    <ef af ef'>-. |
  \voiceOne g4) c'->( \oneVoice <c, d c'>16 <c d b'> <c d bf'> <c d a'>
    <c d af'> <af c f> <f c'> <f af c d> |
  <e bf' c e>16 <f bf c f> <e bf' c e> <d bf' c d>  <e bf' c e> <bf' c f>
    <bf c e af> <bf c e g>  <f c'> <f c' e> <f c' f> <c' g'>  <c d bf'>
    <c d af'> <f, c'> <f c' d> |
  \voiceOne \tuplet 3/2 4 { ef'!4.) s4 \tupletOn \tupletDown \tuplet 3/2 { 
    c16-.( <ef, g d'>-. <ef g c>-. } \tupletOff g4.)^\ten s4 \tupletOn 
    \tuplet 3/2 { g16-.( <b, d af'>-. <b d g>-.) } } |
  \oneVoice c2->~^\ten c16( df f af  df e f af |
  
  \barNumberCheck 73
  b,,2->)~( b16 af' g fs  f g, f' ef |
  c1->)~ |
  c16( g c d  ef fs af g  b d c ef fs g \slashedGrace { bf!8*1/2 } af16 g |
  c4) r <ef,,, g c ef> q |
  q1\fermata 
  \bar "|."
}

rightHandLower = \relative {
  s1 * 8 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 8 |
  
  \barNumberCheck 25
  s1 * 8 |
  
  \barNumberCheck 33
  s1 * 3 |
  s2. \voiceTwo \tuplet 3/2 { d''!8^( f8. e16) }
  s1 * 4 |
  
  \barNumberCheck 41
  s1 * 8 |
  
  \barNumberCheck 49
  \tuplet 3/2 4 { b8\rest <g c ef>-\slurShapeF ^( q  q q q } \tupletOff 
    \tuplet 3/2 4 { 
    <af c ef> q q  q q q |
  <f g d'>8 q q  q q q } <ef g d'>16 <g c ef>^. <g c f>^. <g c ef>^.  <g c d>^.
    <g c ef>^. <g c f>^. <g c g'>^.) |
  \tuplet 3/2 4 { af8 <ef af> q  q q q  <d af'> q q  q q q | }
  \tuplet 3/2 { <c d f>8 q q } s2. |
  \tuplet 3/2 4 { 
    s8 <g' bf ef>-\slurShapeG ^( q  q q q  <af c ef> q q  q q q 
  } |
  \tuplet 3/2 4 { <af bf d> q q  <af d> q q } <g c f>16 <g c ef>^. <g c f>^.
    <g c ef>^.  <g c d>^. <g c ef>^. < g a c f>^. <g a c ef g>^.) |
  \tuplet 3/2 4 { <d g>8 q d } s4 \tuplet 3/2 4 { <ef g>8 q q  <ef fs> q
      <c ef> |
    <bf d>8 q q  q q q  q <b d> q  q q q |
    
    \barNumberCheck 57
    q8 <c ef> q  q q q  <af df> q <df af'>  <f af df> q <bf df> |
    <gf af ef'>8 q q  q q q  <f af df> q q  q q q |
    <f g! d'!>8 q q  <d f> q q
  } s2 |
  \tuplet 3/2 4 {  
    <f g b>8 q q  q16 q q q q <g b>  <g c>8 q q  q q q |
    <d af'>8 q q  q q q  <ef g> q q  q q q |
    <f g>8 q q  q q q <ef g> q q  <g c> <g c ef> q |
    <af c ef>8 q q  q q <f af>  <f af c> q q 
  } s4 |
  \tuplet 3/2 4 {
    <f af bf>8 q q  q <f bf> <f af>  <f g> q q  q \slashedGrace { bf! } <f af>
      <f g> |
      
    \barNumberCheck 65
    <e g bf c e>8 q <g bf c e>  <bf c e>-\slurShapeJ ^( q q  <af c e> q q 
      <af c f> q q) |
  } 
  \tuplet 3/2 4 { <af c ef!> q q-\slurShapeK ^(  q <af bf d> q } <g bf d f>16
    <g bf ef>^. <g bf f'>^. <g bf ef>^.  <g bf d>^. <g bf  ef>^.  <g bf f'>^.
    <g bf g'>^. |
  \tuplet 3/2 4 { <g af>8 q q)  q q q  <f af> q q  <f af c> q q } |
  \tuplet 3/2 4 { q8 q q  <f g b> q q } s2 |
  \tuplet 3/2 4 { <g, c>8 q c  <c' g'> q q } s2 |
  s1 |
  \tuplet 3/2 4 { <ef,! g c>8 q q  q q <ef g>  <c d> q q  <b d> q q } |
  \voiceThree \staffDown <ef, af>8 s4. s2 |
}

rightHand = {
  \global
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  s1 * 8 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 7 |
  \voiceOne r4 <g bf> <fs a> <f af> |
  \key c \major
  
  \barNumberCheck 25
  \crossStaff { <e g>2 <f g b>4 \autoBeamOff q8. q16 } |
  \autoBeamOn \crossStaff e4 s2 \crossStaff g4 |
  \crossStaff { g2 a4 } s |
  s2. \crossStaff { <g b>4 } |
  s1 * 4 |
  
  \barNumberCheck 33
  s1 * 8 |
  
  \barNumberCheck 41
  s1 * 8 |
  
  \barNumberCheck 49
  s1 * 3 |
  s4 s8. \crossStaff { <f g b>16 \tupletOff \tuplet 3/2 { 
    \autoBeamOff <ef g>16 q \autoBeamOn \beamPositionsD ef8[ ef]  ef ef ef 
    \beamPositionsOff 
  } } |
  <ef g bf!>8 s4. s2 |
}

leftHandLower = \relative {
  <c, c'>4-. <g'' ef' g>-. <c,, c'>-. <af'' ef' af>-. |
  <b,, b'>4-. <g'' d' f g>-. <c,, c'>-. <g'' c ef g>-. |
  <af,, af'>4-. < c'' ef af>-. <f,,, f'>-. <f'' c' d>-. |
  <g,, g'>4-. <f'' b>-. <c,, c'>-. <ef'' g>-. |
  <ef,, ef'>4-. <g'' bf! ef g>-. <af,, af'>-. <f'' c' ef>-. |
  <bf,, bf'>4-. <bf'' d af'>8-. r16 <b,, b'>-. <c c'>4-. <a'' ef' g>-. |
  <d,, d'>4-. <bf'' g'>-. <d,,, d'>-. <a''' c>-. |
  <g,, g'>4-. <d'' bf' d>8-. r16 d,( <g, g'>4-.) <d'' bf' d>-. |
  
  \barNumberCheck 9
  <gf,, gf'>4-. <gf'' af c ef> <f,, f'>-. <f'' af df f>-. |
  <c,, c'>4-. <ef'' af ef'>-. <df,, df'>-. <f'' af df>8 r16 <c, c'>-. |
  <b b'>4-. <g'' d'! f>-. <c,, c'>-. <g'' c g'>-. |
  <d, d'>4-. <g' b f' g>-. <ef, ef'>-. <g' c g'>8-. r16 <ef, ef'>-. |
  <f f'>4-. <af' d af'>-.-> <ef, ef'>-. <g' c g'>8-. r16 <c,, c'>-. |
  <b b'>4-. <g'' d' f g>-. <c,, c'>-. <g'' c ef g>8-. r16 c,,-. |
  <f, f'>4-. <f'' c' af'>-. <af,, af'>-. <f'' c' af'>-. |
  <bf,, bf'> <f'' bf d af'>8-. r16 <bf,, bf'>( <b b'>4-.) <g'' d' f g>8 r16 
    <g,, g'>( |
    
  \barNumberCheck 17
  <c c'>4) \staffUp \voiceTwo <c'' e bf'> \staffDown \oneVoice <f,,, f'>
    \staffUp \voiceTwo <c''' ef af> |
  \staffDown \oneVoice <bf,, bf'>4-. <f'' bf d af'>-. <ef, ef'>-. 
    <g' bf d g>-. |
  <af,, af'>4-. <af'' c g'>-. <d,, d'>-. <af'' c f>-. |
  <g,, g'>4-. <g'' b f'>-. <af,, af'>-. <ef'' af ef'>-. |
  <ef,, ef'>4-.  <ef'' g c>-. <f,, f'> <df'' af' df>-. |
  <g,, g'>4-. <e'' bf' c>-. <af,, af'>-. <f'' c'>-. |
  <g,, g'>4-. <ef'' g c>-. <g,, g'>-. <d'' g b>-. |
  \voiceTwo <c,, c'>1-\tieShapeA ~ |
  \key c \major
  
  \barNumberCheck 25
  <c' c'>2 <g g'>4 g'8. g16 |
  <c, c'>4 q q q |
  <c g' e'>2 <a' e'>4 <a, a'>8. q16~ |
  <d a'>2 <g, g'>4 <g' f'> |
  \oneVoice <c, g' c g'>2\arpeggio <c g' f' g>4 <c g' c g'>8 <c g' d' g> |
  <c g' c g'>4\arpeggio <c g' e'> <a' e' a> <e e' b'>\arpeggio |
  <c g' c e g c>2\arpeggio <e b' gs'>4 <f d' a'>8[ r16 <g! d' g!>] |
  q4~ <g, g'> <c g' c g'>2\arpeggio |
  
  \barNumberCheck 33
  <f c' f c'>2 <e c' g'>4 <ef c' a'> |
  <d a' d a'>4 <fs d' a'>8. <fs d' as'>16 <g d' b'>4 <a! d c'> |
  <g d' g d'>2\arpeggio <fs d' a'>4 <f b ds b'> |
  <e b' e b'>2\arpeggio q4 <g d'! b'>
  <c, g' c g'>2\arpeggio <c g' g'>4\arpeggio q8\arpeggio q\arpeggio |
  <c g' c g'>4\arpeggio <c g' e'> <a' e' a> <g e' c'> |
  <g, g'>8\noBeam \tupletOff \tuplet 3/2 8 { <fs fs'>16 <g g'> q
    q[ <af af'> q]  q <g g'> q } <g' d' f! c'>4\arpeggio <g d' f b>8 <g, g'> |
  <g' d' f b>8->\noBeam \tuplet 3/2 8 { <fs, fs'>16 <g g'> q  <gs gs'>[ <a a'>
    q]  <as as'> <b b'> q } <c c'>2^> |
  
  \barNumberCheck 41
  <f c' f c'>8\noBeam\arpeggio \tuplet 3/2 8 { <b, b'>16 <c c'> q  q[ <cs cs'>
    q]  q <d d'> <ef ef'> } <ef'! g c! ef>8->\noBeam \tuplet 3/2 8 { 
    <c, c'>16 <cs cs'> q  q[ <d d'> q]  q <ef! ef'!> <ef' g a ef'> } |
  <d a' d>8->\noBeam \tuplet 3/2 8 { <cs, cs'>16 <d d'> q  q[ <ds ds'> q]
    q[ <e e'> q]  q[ <f f'> q]  q[ <fs fs'> q]  q[ <g g'> <gs gs'>]
    q[ <a a'> <as as'>] } |
  <g! d' b'>8->\noBeam \tuplet 3/2 8 { <cs, cs'>16 <d d'> q  q[ <ds ds'> q] 
    q <e e'> <f f'> } <f' a b d! f>8->\noBeam \stemUp \tuplet 3/2 8 { 
    <d, d'>16_( <ds ds'> q  q[ <e e'> q]  q <f f'> <f' a b d! f>^>) } |
  \stemNeutral <e b' e>8->\noBeam \tuplet 3/2 8 { <ds, ds'>16 <e e'> q
    q[ <f f'> q]  q[ <fs fs'> q]  q[ <g g'> q]  q[ <af af'> <a a'>]
    <as as'>[ <b b'> <c c'>]  <cs cs'> <d d'!> <ds ds'> } |
  <c g' c e>8\noBeam\arpeggio \voiceTwo \grace { fs,16 g } \afterGrace 
    g4.\startTrillSpan { fs16\stopTrillSpan \tieToNextNote g^~ } \oneVoice 
    <g, g'>8\noBeam \clef treble <g'' d' f! b>\arpeggio^\riten 
    <g e' c'>\arpeggio <g d' g d'>\arpeggio |
  \tupletOn
  \tuplet 3/2 { 
      \clefSpaceC \clef bass <c, g' c g'>16->\arpeggio \clefSpaceB \clef treble
      <c' c'>[ <d d'>]
    }
    \tupletOff
    \tuplet 3/2 8 {
      <c c'>->[ <g g'> <a a'>]  \clefSpaceB \clef bass <g g'>->[ <e e'> <f f'>]
      <e e'>->[ <c c'> <d d'>]  <c c'>->[ <g g'> <a a'>]  <g g'>->[ <e e'>
      <f f'>]  <e e'>->[ <c c'> <d d'>]  <c c'>->[ <a a'>-> <e e'>->] 
    } |
  \tuplet 3/2 8 { 
    <g g'>16 <ef'' ef'>[ <d d'>]  <cs cs'>[ <c c'> <b b'>]  <bf bf'>[ <a a'>
    <gs gs'>]  <g g'>[ <fs fs'> <f f'>]  <e e'>->[ <ds ds'> <d d'>]  <cs cs'>[
    <c c'> <b b'>]  <bf bf'>->[ <a a'> <af af'>]  <g g'>->[ <fs fs'> <a a'>]
  } |
  <g' d' f b>8\noBeam\arpeggio \tuplet 3/2 8 { \clef treble <e'' e'>16[ <d d'> 
    <a a'>]  \clefSpaceA \clef bass <g g'>[ <e e'> <d d'>]  <a a'>[ <g g'> 
    <g, g'>] <c, c'>[( <g' g'> q])  q[( <c c'> q])  q[( <g' g'> q])  q[( <c c'>
    q]) 
  } |
  
  \barNumberCheck 49
  \key c \minor
  \tupletOn \tuplet 3/2 4 { <c c'>8( <ef c'> <g ef'>  <ef c'> <g ef'> 
      <ef c'>) } \tupletOff \tuplet 3/2 4 { 
      <f, f'>( <f' c'> <af ef'>  <f c'> <af ef'> <f  c'>) |
    <b,, b'>8 <b' g'> <d d'>  <b g'> <d d'> <b g'>  <c, c'> <c' g'> <ef ef'>
      <c g'> <ef ef'> <c g'> |
    <af, af'>8 <c' af'> <ef c'>  <c af'> <ef c'> <c af'>  <f,, f'> <d'' f af> 
      <f af c>  <d f af> <f af c> <d f af> |
    <g,, g'>8 <g' d'> <d' g>  \voiceTwo <g, d'> <d' g> <g, d'>  <c, c'> <g' c>
      <c g'>  <c g> <c g'> <g c> |
    <ef, ef'>8 <ef'' bf'> <g ef'>  <ef bf'> <g ef'> <ef bf'>  <af,, af'>
      <f'' c'> <af ef'>  <f c'> <af ef'> <f c'> |
    \oneVoice <bf,, bf'>8 <bf' af'> <f' d'>  <bf, af'> <f' d'> <b,, b'>
      \stemUp <c c'> <c' g'> <ef ef'>  \stemNeutral <c g'> <ef ef'> <c g'> |
    <d, d'>8 <bf' g'> <d bf'>  <bf g'> <d bf'> <d, d'>  <d, d'> <d'' a'> <a' c>
      <d, a'> <a' c> <d, a'> |
    <g,, g'>8 <g' d'> <d' g>  <g, d'> <d' g> d,  <g, g'> <g' d'> <d' g>
      <g, d'> <d' g> <g,, g'> |
      
    \barNumberCheck 57
    <gf gf'>8 <gf' ef'> <c af'>  <gf ef'> <c af'> <gf, gf'>  <f f'> <f' df'>
      <df' af'>  <f, df'> <df' af'> <f,, f'> |
    \stemUp <c' c'>8 <c' af'> <ef ef'>  <c af'> <ef ef'> <c, c'>  <df df'> 
      <df' af'> <f df'>  <df af'> <f df'> <c, c'> |
    <b b'>8 <b' g'> <d! d'!>  <b g'> <d g> <b, b'>  <c c'> <c' g'> <ef c'>
      <c g'> <ef ef'> <c, c'> |
    \stemNeutral <d d'>8 <d' g> <g d'>  <d g> <g d'> <d, d'>  <ef ef'> <ef' c'>
      <g ef'>  <ef c'> <g ef'> <ef, ef'> |
    <f f'>8 <f' b> <b f'>  <f b> <b f'> <f, f'>  <ef ef'> <c' g'> <g' c>
      <c, g'> <g' c> <c,, c'> |
    <b b'>8 <b' g'> <d d'>  <b g'> <d d'> <b, b'>  <c c'> <c' g'> <ef c'>
      <c g'> <ef g ef'> <c, c'> |
    <f, f'>8 <f'' af c> <af c ef>  <f af c> <af c ef> <f,, f'>  <af af'> 
      <f'' af c> <af c ef>  <f af c> <af c ef> <af,, af'> |
    <bf bf'>8 <bf' af'> <f' d'>  <bf, af'> <f' d'> <bf,, bf'>  <b b'> <b' g'>
      <d d'> <b g'> <d d'> <b, b'> |
      
    \barNumberCheck 65
    <c c'>8 <g'' bf c> <bf c e>  <g bf c> <bf c e> <c,, c'>  <f f'> <f' c'>
      <af c e>  <f af c> <af c f> <f, f'> |
    <bf, bf'>8 <f'' af c> <af c ef!>  <f af c> <af bf d> <bf,, bf'>  <ef ef'>
      <ef' g bf> <g bf d>  <ef g bf> <g bf d> <ef, ef'> |
    <af, af'>8 <c' ef af> < ef af c>  <c ef af> < ef af c> <af,, af'>  <d d'>
      <d' f af> < f af c>  <d f af> < f af c> <d, d'> |
    <g, g'>8 <d'' f af> <f af c>  <d g> <g b> <g,, g'> <af af'> <c' af'>
      <ef af c> <c af'> <ef af c> <af,, af'> |
    <ef ef'>8 ef'' <g ef'>  <ef g c> <g ef'> <ef,, ef'>  <f f'> <f'' c' d>
      <c' d f>  <f, c' d> <c' d af'> <f,,, f'> |
    <g g'>8 <g'' c> <c g'>  <g c> <c g'> <g,, g'>  <af af'> <f'' c'> <c' f> 
      \stemUp <f, c' d> <c' d af'> <af,, af'> \stemNeutral |
    <g g'>8 <c' g'> <g' c>  <c, g'> <g' c> <c, g'>  <g, g'> <g' d'> <d' g>
      <g, d'> <d' g> <g,, g'> |
    \voiceTwo <gf gf'>8 <gf' ef'> <ef' af>  \oneVoice <gf, ef'> <ef' af>
      <gf,, gf'>  <f f'> <f' df'> <df' af'>  <f, df'> <df' af'> <f,, f'> |
      
    \barNumberCheck 73
    <g! g'!>8( <g' d'!> <d' f>  <f af> q q)  <g,, g'>( <g' d'> <d' f>  <f b>
      q q) |
    c,,8 g''( <g ef'>  <ef' g> q) g,,-.  c-. g'( <g ef'>  <ef' g> q) g,,-. |  
  }
  c,4 r r2 |
  r2 <c' c'>4 q |
  <c g' c>1_\fermata |
}

leftHand = {
  \global
  \clef bass
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override TextScript.Y-offset = -0.5
  \tag layout { s1^\mezzaVoce | } \tag midi { s1\mf | }
  s1 * 7 |
  
  \barNumberCheck 9
  s1 * 2 |
  s4 s\> s2\< <>\! |
  s1 * 2 |
  s4 s\> s8 s\! s4 |
  s1\p |
  s1 |
  
  \barNumberCheck 17
  s1 * 3 |
  s2 s4..\< s16\! |
  s2\> s16 s8.\! s4 |
  s1 * 2 |
  s4 s2\> s8. s16\! |
  
  \barNumberCheck 25
  \tag layout { s1^\sottoVoce | } \tag midi { s1\pp | }
  s1 |
  s2. s4-\tweak Y-offset 1 -\tweak to-barline ##f \< |
  s2-\tweak Y-offset 1 \> s4\! s-\tweak to-barline ##f \< |
  s4\! \tag layout { s2.^\sempreP | } \tag midi { s2.\p | }
  s1 * 2 |
  s2\> s\! |
  
  \barNumberCheck 33
  s1 * 4 |
  s1\pp |
  s4 s2.-\tweak to-barline ##f \< |
  s8\! s8.\< s16\! s8\> s4..-\tweak Y-offset 1 \> s16\! | 
  s8 s4.\cresc s2\! |
  
  \barNumberCheck 41
  s8\f s4.\cresc s8\! s4\cresc s16. s32\! |
  s4 s2\cresc s8.. s32\! |
  \override DynamicTextSpanner.style = #'none
  s8 s\cresc s4 s8 s4.\cresc |
  \revert DynamicTextSpanner.style
  s8 s\cresc s2 s8.. s32\! |
  s2\ff s4..\< s16\! |
  s1 |
  s16 \tag layout { s-\tweak extra-offset #'(0 . -1) ^\sempreFf } 
      \tag midi   { s\ff } s8 s2. |
  s2^\riten s16\sfp s^\accel s4. |
  
  \barNumberCheck 49
  \tag layout { s1^\ppAgitato | } \tag midi { s1\pp | }
  s1 * 2 |
  \tuplet 3/2 { s4 s8\< s4. s16 s\! s4\> s4 s8\! } | 
  s1 * 2 |
  s2\< s\! |
  \override DynamicTextSpanner.style = #'none
  \tuplet 3/2 { s4-\tweak Y-offset -1 \> s8\! } s4 s2-\tweak Y-offset -1 
    \cresc |
  
  \barNumberCheck 57
  s1 |
  s2...-\tweak Y-offset 1 \> s16\! |
  s2 s4..-\tweak Y-offset 1 \< s16\! |
  s2 s4..\> s16\! |
  s4 s\< s4.. s16\! |
  s2 s4..\< s16\! |
  s1\sf |
  \revert DynamicTextSpanner.style
  s1\cresc |
  
  \barNumberCheck 65
  s2... s16\! |
  s4..\> s16\! s4..\< s16\! |
  s2...\< s16\! |
  s4 s\> s4..\< s16\! |
  s4 s2.\f |
  s1 |
  \tuplet 3/2 { s4\> s8\! s4\< s16 s\! s4\> s8\! s4\< s16 s\! } |
  s8\ff s^\riten s4 s4..\< s16\! |
  
  \barNumberCheck 73
  s1 |
  s8 s\dimRall s2. |
  s1 |
  s2 s\pp |
  s1 |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \tempo "Lento" 4 = 60
  s1 * 8 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 8 |
  
  \barNumberCheck 25
  \tempo "Poco più lento" 4 = 56
  s1 * 8 |
  
  \barNumberCheck 33
  s1 * 8 |
  
  \barNumberCheck 41
  s1 * 4 |
  s2 s8 \tempo 4 = 50 s4. |
  \tempo 4 = 56
  s1 * 2 |
  s2 \tempo 4 = 60 s4 \tempo 4 = 66 s |
  
  \barNumberCheck 49
  \tempo 4 = 80
  s1 * 8 |
  
  \barNumberCheck 57
  s1 * 8 |
  
  \barNumberCheck 65
  s1 * 7 |
  \tempo 4 = 72
  s1 |
  
  \barNumberCheck 73
  \tempo 4 = 66
  s1 |
  \tempo 4 = 60
  s1 |
  \tempo 4 = 56
  s1 |
}

pedal = {
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4..\sd s16\su |
  s4.\sd s8\su s4.-\tweak Y-offset -1 \sd s8\su |
  s4..\sd s16\su s4.-\tweak Y-offset -2 \sd s8\su |
  s4.-\tweak Y-offset -1 \sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4..\sd s16\su |
  s4..\sd s16\su s4..-\tweak Y-offset -2 \sd s16\su |
  s4.\sd s8\su s4.-\tweak Y-offset -1 \sd s8\su |
  
  \barNumberCheck 9
  s4.\sd s8\su s4.\sd s8\su |
  s4.-\tweak Y-offset -3 \sd s8\su s4.-\tweak Y-offset -3 \sd s8\su |
  s4.-\tweak Y-offset -1\sd s8\su s4.\sd s8\su |
  s4..\sd s16\su s4..\sd s16\su |
  s4.\sd s8\su s4..\sd s16\su |
  s4.-\tweak Y-offset -1 \sd s8\su s4..\sd s16\su |
  s4.-\tweak Y-offset -2 \sd s8\su s4.-\tweak Y-offset -1 \sd s8\su |
  s4..\sd s16\su s4..\sd s16\su |
  
  \barNumberCheck 17
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4..\sd s16\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4..\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s4..\sd s16\su s4..\sd s16\su |
  s4..\sd s16\su s4..\sd s16\su |
  s1 |
  
  \barNumberCheck 25
  s4\sd s\su s4..-\tweak Y-offset -1 \sd s16\su |
  s1\sd |
  s4 s\su s4..\sd s16-\tweak Y-offset -2 \su |
  s4\sd s\su s8-\tweak Y-offset -2 \sd s\su s\sd s\su |
  s4\sd s\su s8\sd s\su s\sd s\sd |
  s4.\sd s8\su s4 s8\sd s\su |
  s4\sd s\su s8\sd s\su s8.\sd s16\sd |
  s4 s-\tweak Y-offset -1 \su s4.\sd s8\su |
  
  \barNumberCheck 33
  s4\sd s\su s8\sd s\su s\sd s\su |
  s4..\sd s16\su s8\sd s\su s\sd s\su |
  s4\sd s\su s8\sd s\su s\sd s\su |
  s4\sd s\su s8\sd s\su s\sd s\su |
  s4\sd s\su s s8.\sd s16\su |
  s8\sd s\su s\sd s\su s\sd s\su s\sd s\su |
  s1 * 2 |
  
  \barNumberCheck 41
  s8\sd s\su s4 s8\sd s16 s\su s4 |
  s1 * 3 |
  s4.\sd s8\su s\sd s\su s\sd s\su |
  s16\sd s\su s8 s2. |
  s16.\sd s32\su s8 s4 s8.\sd s16\su s16\sd s\su s16.\sd s32\su |
  s8..\sd s32\su s4 \tag layout { s2-\tweak Y-offset -1 \sd | }
                    \tag midi   { s4..\sd s16\su | }
  
  \barNumberCheck 49
  \tuplet 3/2 4 { 
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.-\tweak Y-offset -1 \sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s16 s\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.-\tweak Y-offset -3 \sd s4 s8\su s4.-\tweak Y-offset -2 \sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s16 s\su |
    s4.\sd s4 s8\su s4.-\tweak Y-offset -2 \sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    
    \barNumberCheck 57
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s16 s\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    
    \barNumberCheck 65
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s4.\sd s4 s8\su s4.\sd s4 s8\su |
    s1. |
    s4.-\tweak Y-offset -1 \sd s4 s8\su s4.\sd s4 s8\su |
    
    \barNumberCheck 73
    s2.\sd s8 s4\su s4\sd s8\su |
    s2.-\tweak Y-offset -2 \sd s4. s4 s8\su |
  }
  s4-\tweak Y-offset -2 \sd s2.\su |
  s2 s\sd |
  \tag layout { s1 } \tag midi { s2... s16\su | }
}

forceBreaks = {
  % page 1
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \pageBreak
  
  % page 2
  \repeat unfold 3 { s1 \noBreak } s1 \break\noPageBreak
  \grace{ s8 } \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 3 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 4 { s1 \noBreak } s1 \break\noPageBreak
  \grace{ s8 } \repeat unfold 4 { s1 \noBreak } s1 \pageBreak

  % page 3
  \repeat unfold 3 { s1 \noBreak } s1 \break\noPageBreak
  s1 \noBreak s1 \break\noPageBreak
  s1 \noBreak s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s2 \break\noPageBreak
  s2 \noBreak s1 \pageBreak
  
  % page 4
  s1 \noBreak s1 \break\noPageBreak
  s1 \noBreak s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \pageBreak

  % page 5
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
  \repeat unfold 2 { s1 \noBreak } s1 \break\noPageBreak
}

nocturneOneNotes =
\score {
  \header {
    title = "Nocturne One"
    composer = "Frédéric Chopin"
    opus = "Opus 48, No. 1"
  }
  \keepWithTag layout  
  \new PianoStaff \with {
    \consists "Span_stem_engraver"
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \pedal
    \new Dynamics \tempi
    \new Devnull \forceBreaks
  >>
  \layout {
    \context {
      \Staff
      \consists Span_arpeggio_engraver
    }
  }
}

\include "articulate.ly"

nocturneOneMidi =
\book {
  \bookOutputName "nocturne-op48-no1"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
