%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'((0 . -2) (0 . -1) (0 . 0.5) (0 . 0)) \etc
slurShapeB = \shape #'((0 . 2) (0 . 1.5) (0 . 0.5) (0 . 0)) \etc
slurShapeC = \shape #'((0 . 1.5) (0 . 1) (0 . 0) (0 . 0)) \etc
slurShapeD = \shape #'((0 . 0.5) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeE = \shape #'((0 . 1) (0 . 0.5) (0 . 0) (0 . 0)) \etc
slurShapeF = \shape #'((0 . -1) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeG = \shape #'((0 . -1.5) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeH = \shape #'((0 . -0.5) (0 . 0) (-1 . 0.5) (0 . 0)) \etc
slurShapeI = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 3) (0 . 3) (0.5 . 3) (0 . 2.5))
                        ) \etc
slurShapeJ = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeK = \shape #'((0 . 1) (-1 . 2) (-5 . 2) (-0.5 . -1)) \etc
slurShapeL = \shape #'((0 . -4) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeM = \shape #'((0 . 0) (0 . 0) (-2 . -1) (0 . 3)) \etc
slurShapeN = \shape #'((0 . 0) (0 . 0) (0 . -1) (0 . 3)) \etc
slurShapeO = \shape #'((0 . 0) (0 . 0) (1 . -1) (0 . 3)) \etc
slurShapeP = \shape #'((0 . 0) (0 . 0) (-7 . -1) (0 . 0)) \etc
slurShapeQ = \shape #'(
                        ((0 . 0) (0 . 0) (-2 . 2) (0 . 2.75))
                        ((0 . 0.5) (0 . 1) (0 . 0) (0 . 0))
                        ) \etc
slurShapeR = \shape #'((0 . 0) (3 . -0.5) (-3 . 0) (0 . 0)) \etc
slurShapeS = \shape #'(
                        ((0 . 0) (0 . 0.5) (0 . 0.5) (0 . 0))
                        ((0.25 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.25 . 0.5) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeT = \shape #'((0 . -1) (0 . 0.5) (0 . 0) (0 . 0)) \etc
slurShapeU = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0.5))
                        ((0.5 . -1) (0 . 0) (0 . 3.5) (0 . 1))
                        ) \etc
slurShapeV = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.25 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeW = \shape #'((0 . 0) (0 . 2) (0 . 0) (-2 . -0.5)) \etc
slurShapeX = \shape #'(
                        ((0 . 2.5) (0 . 3) (0 . 3) (0 . 3))
                        ((0.25 . 0) (0 . 0) (0 . 3) (0 . 3))
                        ) \etc
slurShapeY = \shape #'((0.25 . 0.25) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeZ = \shape #'((0 . 0) (0 . 0) (0 . -1) (0 . 2.5)) \etc

tieShapeA = \shape #'((0 . 0) (0 . -1.75) (0 . -1.75) (0 . 0)) \etc
tieShapeB = \shape #'((0 . 0) (0 . -2) (0 . -2) (0 . 0)) \etc
tieShapeC = \shape #'((0 . 0) (0 . 0) (0 . -0.5) (0 . 0)) \etc
tieShapeD = \shape #'((0 . -0.75) (0 . -1.75) (0 . -1) (0 . 0)) \etc

moveNoteA = \once \override NoteColumn.force-hshift = -2

trillBelow = \tweak Script.script-priority -100 \etc

smorzSpanner = \override TextSpanner.bound-details.left.text = \smorz

%%% Music %%%

global = {
  \time 4/4
  \key fs \minor
}

rightHandUpper = \relative {
  r4 \voiceOne cs'2->( <fs, ds'>4 |
  <gs es'>4 <a fs'> <cs_~ es~ a> <cs es gs>8. fs16 |
  \slashedGrace { a,8*1/2 } fs'4) \oneVoice fs'-\slurShapeJ ( e d8 cs |
  e8 d cs b  cs gs a \slashedGrace { cs8*1/2 } b8 |
  a8 fs fs' es e4 d8 cs |
  e8 d cs b  cs b \tuplet 3/2 { b a gs) } |
  fs4-\slurShapeI ( gs8 a b2~ |
  b8 cs d e  gs fs e d |
  
  \barNumberCheck 9
  cs4 bs8 cs ds2~ |
  ds8 e fs gs  b a \tuplet 3/2 { a gs fs } |
  gs4 cs,8 cs' b4 a8 gs | 
  b8 a gs fs  gs ds \tuplet 3/2 { e gs fs } |
  e8 cs cs' bs b4 a8 gs |
  b8 a gs fs  gs fs \tuplet 3/2 { fs e ds } |
  cs4 ds8 e fs2~ |
  fs8 gs a b  ds cs \tuplet 3/2 { cs b a } |
  
  \barNumberCheck 17
  gs4 fss8 gs as2~ |
  as8 b cs ds  fs e \tuplet 3/2 { e ds cs } |
  e8 ds cs b  as gs e cs |
  ds2 gs, |
  b2 e,4 ds8 cs |
  ds1~^\ten |
  ds4 gs fs e8 ds |
  fs8 e ds cs  e ds cs e |
  
  \barNumberCheck 25
  ds4) gs'( fs e8 ds |
  fs8 e ds cs  ds cs \tuplet 3/2 { cs bs as } |
  gs1->~ |
  gs2) r |
  s2 cs,4->^( <fs, ds'> |
  <gs es'>4 <a fs'> <cs es a>~ <cs es gs>8. fs16 |
  \slashedGrace { a,8*1/2 } fs'4) \oneVoice fs'-\slurShapeJ ( e d8 cs |
  e8 d cs b  cs gs a \slashedGrace { cs8*1/2 } b8 |
  
  \barNumberCheck 33
  a8 fs fs' es e4 d8 cs |
  e8 d cs b  cs b \tuplet 3/2 { b a gs) } |
  fs4-\slurShapeI ( gs8 a b2~ |
  b8 cs d e  gs fs \tuplet 3/2 { fs e d } |
  cs4 bs8 cs ds2~ |
  ds8 e fs gs  b a \tuplet 3/2 { a gs fs } |
  gs4 cs,8 cs' b4 a8 gs |
  b8 a gs fs  gs[ ds \tuplet 3/2 { e gs fs] } |
  
  \barNumberCheck 41
  e8[ cs \grace { cs8*1/2 ds cs bs cs cs } cs'8 bs] b4 a8 gs |
  b8 a gs fs  gs fs \tuplet 3/2 { fs e ds } |
  cs4 ds8 e <fs, fs'>2~ |
  q8 <gs gs'> <a a'> <b b'> \grace { ds8*1/2_~ } <ds ds'>8 <cs cs'> 
    \tuplet 3/2 { <cs cs'> <b b'> <a a'> } |
  <gs gs'>4 <fss fss'>8 <gs gs'> <as as'>2~ |
  q8 <b b'> <cs cs'> <ds ds'>  <fs fs'> <e e'> \tuplet 3/2 { <e e'> <ds ds'>
    <cs cs'> } |
  <e e'>8 <ds ds'> <cs cs'> <b b'>  <as as'> <gs gs'> <e e'> <cs cs'> |
  <ds ds'>2 <gs, gs'> |
  
  \barNumberCheck 49
  <b b'>2 e4 ds8 cs |
  ds1~ |
  ds4 gs fs e8 ds |
  fs8 e ds cs  e ds cs e |
  ds4) gs'( fs e8 ds |
  fs8 e ds cs  ds cs \tuplet 3/2 { cs bs as } |
  gs1~ |
  gs2^\ritenuto e) |
  
  \barNumberCheck 57
  \bar "||"
  \key df \major
  \time 3/4
  <f, af df f>4^( <gf c gf'>) \voiceOne \staffDown \tuplet 5/4 { 
    g16->-\slurShapeK ( af c, gf' c } |
  \oneVoice \staffUp bf'8. bff16 af2) |
  <af, df af'>4^( <bf df bf'>) \tuplet 5/4 { gf16( a bf df gf } |
  ef'8. df16 bf4 gf8. f16) |
  <gf, c ef>4^( <gf c f>) \voiceOne \staffDown \tuplet 5/4 { g16-\slurShapeL (
    af c, gf' c } |
  \staffUp bf'8. af16 f2) |
  <gf, c ef>4^( <gf c f>) \voiceOne \staffDown \tuplet 5/4 { g16-\slurShapeM (
    af c, gf' c } |
  \staffUp <bff gf'>8. <af f'>16 <f df'>4_~ <f a ef' f>) |
  
  \barNumberCheck 65
  <df' f df'>4\( <bf f' bf> <df g c> |
  \slurDown \acciaccatura { bf'8 } <c, ef af>8. <bf ef g>16( <c ef af>2) |
  <cf ef cf'>4 <af ef' af> <cf f bf> |
  \acciaccatura { af'8 } <bf, df gf>8. <af df f>16 <bf df gf>4 <af df f af> |
  % SrcB has last c tied to <gf c ef> in the next measure
  <bf df gf bf>4 <bf ef c'>\) \tuplet 6/4 { a16^( ef' gf e f c') } |
  <gf ef'>8.^( <f_~ df'>16 <f bf>4) <f af f'>8.^(^\stretto <g e'>16 |
  c4) <f, af f'>8.^( <g e'>16~ <g c>4) |
  <ef! gf! ef'!>4..(^\ritenuto <af, af'>16 <af ef' gf af>4) |
  
  \barNumberCheck 73
  <f df' f>4^( <gf c gf'>) \voiceOne \staffDown \tuplet 5/4 { 
    g16->-\slurShapeK ( af c,_\< gf' c } |
  \oneVoice \staffUp bf'8. bff16\! af2) |
  <gs, e' gs>4^(^\pocoRitenuto <a ds a'>) \voiceOne \staffDown \tuplet 5/4 {
    as16-\slurShapeP ( b ds, a' ds16*3/4 s64 } |
  \oneVoice \staffUp \slashedGrace { ds8*1/4 } cs'8. b16 as8 a4 gf!8) |
  <gf, c ef af!>4^(^\aTempo <gf c f af>) \voiceOne \staffDown \tuplet 5/4 { 
    g16 -\slurShapeL (af c, gf' c } |
  \staffUp bf'8. af16 f2) |
  <gf, c ef>4^( <gf c f>) \voiceOne \staffDown \tuplet 5/4 { g16( af c, gf' 
    c) } |
  \staffUp <bff gf'>8.( <af f'>16 <f df'>4) <f a ef' f>( |
  
  \barNumberCheck 81
  \oneVoice <df' f df'>4 <bf f' bf> <df g c> |
  \slurDown \acciaccatura { bf'8 } <c, ef af>8. <bf ef g>16 <c ef af>2 |
  <cf ef cf'>4 <af ef' af> <cf f bf> |
  \acciaccatura { af'8 } <bf, df gf>8. <af df f>16 <bf df gf>4 <af df f af>) |
  <bf df gf bf>4 <bf ef c'> \tuplet 6/4 { a16^( ef' gf e f c'~ } |
  \voiceOne <gf c ef>8. <f df'>16~ <f bf>4) <f af f'>8.^( <g e'>16~ |
  <g c>4) <f af f'>8.^( <g e'>16~ <g c>4 |
  <ef! gf! ef'!>4.. <af, af'>16 af'4 |
  
  \barNumberCheck 89
  <f, df' f>4 <gf c gf'>) \voiceOne \staffDown \tuplet 5/4 { 
    g16->-\slurShapeK ( af c, gf' c } |
  \oneVoice \staffUp bf'8. bff16 af2) |
  <gs, e' gs>4^(^\ritenuto <a ds a'>) \voiceOne \staffDown \tuplet 5/4 {
    as16-\slurShapeQ ( b ds, a' ds16*3/4 s64 } | % space before bar line
  \oneVoice \staffUp \slashedGrace { ds8 } cs'8. b16 as8 a4 gf!8) |
  <gf, c ef af!>4^(^\aTempo <gf c f af>) \voiceOne \staffDown \tuplet 5/4 { 
    g16 -\slurShapeL (af c, gf' c } |
  \staffUp bf'8. af16 f2) |
  \oneVoice <bf, e g c>4( <bf e af c>) \tuplet 6/4 { b16( c ds e g bf! } |
  <e, df'>8. <f c'>16~ <f af>4) <e df'>16.( <f c'>32~ <f af>8)\noBeam |
  
  \barNumberCheck 97
  <gf c ef af>4 <gf c f af> \voiceOne \tuplet 5/4 { g16-\slurShapeR ( af c,
    gf' c } |
  bf'8. af16 \oneVoice \tuplet 13/8 { f df af f df \staffDown af f df bf af f
    df bf16*3/4 s64) } | % push last 16th note away from bar line
  \staffUp \voiceOne <gf'' c ef>4-\slurShapeS ( f'4.. gf16 |
  fs4 fs4.. fs16 | 
  \bar "||"
  \key fs \minor
  \time 4/4
  \oneVoice \acciaccatura { fs,8 } <fs cs' fs>4 fs'' e d8 cs |
  e8 d cs b  cs gs a \slashedGrace { cs8*1/2 } b8 |
  a8[ fs \grace { fs8*1/2 gs fs es fs fs } fs'8 es] e4 d8 cs |
  e8[ d \tuplet 3/2 { d cs b] } \tuplet 5/4 { cs gs a cs b } |
  
  \barNumberCheck 105
  a4 gs8 a as2->~ |
  as8 b cs d  e fs g as, |
  b4 as8 b bs2->~ |
  bs8 cs ds es  fs gs a fs, |
  \stemDown
  es8)[ r16 es']-\slurShapeU ( es4\trill \grace { dss16 es } gs8[ fs 
    \tuplet 3/2 { fs e d] } |
  \stemNeutral
  bs8 cs \slashedGrace { e8*1/2 } d8 cs  cs, gs' a b |
  a8 fs gs a d,2->~ |
  << 
    { \voiceFour \hideNoteHead d8 s4. } 
    \new Voice { \voiceThree a'8 fs gs a } 
  >> \oneVoice b,2->) |
  
  \barNumberCheck 113
  fs'''2( e8 d cs b |
  gs8 fs d cs  as b cs \slashedGrace { e8*1/2 } d8 |
  cs,4) r cs'2-\slurShapeV \( |
  d8 cs b a  gs fs b a |
  \grace { fs16*1/2 gs } gs1\startTrillSpan |
  \afterGrace 7/8 gs1 { fss16(\stopTrillSpan gs } |
  cs2) bs |
  b!2 as |
  
  \barNumberCheck 121
  a!2 a~ |
  a4. gs8 \grace { gs16*1/2 b } a4 gs\) |
  \grace { cs,8 <fs cs'> cs'_~ } <cs fs cs'>2( <bs gs' bs> |
  <b! es b'!>2 <as fs' as> |
  <a! b a'!>2 <a bs a'>~ |
  \voiceFour <a a'>4. <gs gs'>8 <a a'>4. <gs gs'>8 |
  \voiceOne <gs gs'>4 <fs-\tieShapeC _~ fs'~>2.) |
  \moveNoteA <fs-\tieShapeD _~ fs'~>1 |
  
  \barNumberCheck 129
  \voiceFour q4 \voiceOne fs2.~-\slurShapeX ( |
  fs2 cs~ |
  \oneVoice cs4)-\slurShapeY _( \grace { bs16 cs } \afterGrace 7/8 { 
    cs2->-\trillBelow\trill^\trillSharp } { bs16 cs } b'!8) r |
  as4( \grace { bs,16 cs } \afterGrace 7/8 
    { cs2->-\trillBelow\trill^\trillSharp } { bs16 cs } gs'8) r |
  fs4( \grace { bs,16 cs } \afterGrace 7/8
    { cs2->-\trillBelow\trill^\trillSharp } { bs16 cs cs } <b'! ds>8-.) r |
  <as cs>4( \grace { bs,16 cs } \afterGrace 7/8
    { cs2->-\trillBelow\trill^\trillSharp } { bs16 cs cs } <gs' b! cs>8-.) r |
  <fs as cs>4 \grace { bs,16 cs } cs2.(^\trillSharp\startTrillSpan |
  \after 4 \stopTrillSpan cs1*1/2 \magnifyMusic #2/3 { \scaleDurations 4/20 {
    bs8[ cs ds es fs gs as b! cs ds es fs gs as b cs ds es fs gs]
  } } |
  as4-.) r <fs,, as fs'>2\fermata |
  \bar "|."
}

rightHandLower = \relative {
  \voiceFour 
  s4 cs'2.-\tieShapeA ~ |
  cs2 s4 b4 |
  s1 * 6 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 8 |
  
  \barNumberCheck 25
  s1 * 4 |
  s2 cs-\tieShapeB ~ |
  cs2 s4 b4 |
  s1 * 2 |
  
  \barNumberCheck 33
  s1 * 8 |
  
  \barNumberCheck 41
  s1 * 8 |
  
  \barNumberCheck 49
  s1 * 8 |
  
  \barNumberCheck 57
  \key df \major
  \time 3/4
  s2. * 5 |
  df2. |
  s2. * 2 |
  
  \barNumberCheck 65
  s2. * 5 |
  \voiceThree \staffDown a8.-\slurShapeN _( bf16 \voiceFour \staffUp df4)
    \voiceThree \staffDown b8.-\slurShapeN _( c16 |
  \voiceFour \staffUp e4) \voiceThree \staffDown b8.-\slurShapeO _( c16
    \voiceFour \staffUp e4) |
  s2. |
  
  \barNumberCheck 73
  s2. * 5 |
  df2. |
  s2. * 2 |
  
  \barNumberCheck 81
  s2. * 5 |
  \voiceThree \staffDown a8.-\slurShapeN _( bf16 \voiceFour \staffUp df4) 
    \voiceThree \staffDown b8.-\slurShapeZ _( c16 |
  \voiceFour \staffUp e4) \voiceThree \staffDown b8.-\slurShapeO _( c16
    \voiceFour \staffUp e4) |
  s2 <af, ef' gf>4 |
  
  \barNumberCheck 89
  s2. * 5 |
  df4 df2 |
  s2. * 2 |
  
  \barNumberCheck 97
  \tupletOff s2 \tuplet 5/4 { s8 c s16 } |
  df'4 s2 |
  s4 <gf,, c>2 |
  <fs cs'>2. |
  \key fs \minor 
  \time 4/4
  \grace { s8 } s1 * 4 |
  
  \barNumberCheck 105
  s1 * 5 |
  s2 cs'4 s |
  s1 |
  \tuplet 3/2 { d8*2 \voiceThree \staffDown cs8 } s2. \staffUp |
  
  \barNumberCheck 113
  s1 * 8 |
  
  \barNumberCheck 121
  s1 * 5 |
  \voiceOne cs'2 \grace { b8 b \tieToNextNote cs~ b' } cs,2
  \voiceFour cs2 e4-\slurShapeW ^(-\p d8 cs |
  e8 d cs b  d cs b d |
  \voiceOne cs4) \voiceFour fs,4 e d8 cs |
  \tupletOn
  % SrcB: e8 d cs b
  e8[ d \tuplet 3/2 { d cs b] }  cs[ b \tuplet 3/2 { b as gs] } |
  % SrcA does not have the fs
  fs4 s2. |
}

rightHand = {
  \global
  \mergeDifferentlyDottedOn
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  s1 * 6 |
  \voiceThree \tupletOff
  \tuplet 3/2 { fs2*1/4 a4.*1/3 s8 } s4 \tuplet 3/2 { f2*1/4 a4.*1/3 s8 } s4 |
  \tuplet 3/2 { e2*1/4 a4.*1/3 s8 } s4 \tuplet 3/2 { e2*1/4 gs4.*1/3 s8 } s4 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 8 |
  
  \barNumberCheck 25
  s1 * 8 |
  
  \barNumberCheck 33
  s1 * 2 |
  \tuplet 3/2 { fs2*1/4 a4.*1/3 s8 } s4 \tuplet 3/2 { f2*1/4 a4.*1/3 s8 } s4 |
  \tuplet 3/2 { e2*1/4 a4.*1/3 s8 } s4 \tuplet 3/2 { e2*1/4 gs4.*1/3 s8 } s4 |
  s1 * 4 |
  
  \barNumberCheck 41
  s1 * 8 |
  
  \barNumberCheck 49
  s2 \crossStaff { e4 \autoBeamOff ds!8 cs } \autoBeamOn |
  ds4 s2. |
  s1 * 6 |
  
  \barNumberCheck 57
  \key df \major
  \time 3/4
  s2. * 5 |
  e8.( f16 af2) |
  s2. |
  df,,8.( af'16 \hideNoteHead df4) s |
  
  \barNumberCheck 65
  s2. * 8 |
  
  \barNumberCheck 73
  s2. * 5 |
  e8.( f16 af2) |
  s2. |
  df,,8.( af'16 \hideNoteHead df4) s |
  
  \barNumberCheck 81
  s2. * 8 |
  
  \barNumberCheck 89
  s2. * 5 |
  e8.( f16 af2) |
  s2. * 2 |
  
  \barNumberCheck 97
  s2. * 4 |
  \key fs \minor
  \time 4/4
  \grace { s8 } s1 * 4 |
  
  \barNumberCheck 105
  s1 * 8 |
  
  \barNumberCheck 113
  s1 * 8 |
  
  \barNumberCheck 121
  s1 * 8 |
  
  \barNumberCheck 129
  s1 |
  \tuplet 3/2 { s8 d,4.*2/3 } s2. |
}

leftHandLower = \relative {
  \stemDown 
  cs,1~ |
  cs1 |
  \tuplet 3/2 { fs8( cs' a' } fs4) \tuplet 3/2 { fs,8( cs' as' } fs4) |
  \tuplet 3/2 { b,8-\slurShapeA ( fs' d' } gs,4) \tuplet 3/2 { cs,8( es cs' }
    b4) |
  \tuplet 3/2 { fs,8( cs' a' } fs4) \tuplet 3/2 { as,8( e'! cs' } fs,4) |
  \tuplet 3/2 { b,8-\slurShapeA ( fs' d' } gs,4) \tuplet 3/2 { cs,8( es cs' }
    b4) |
  \voiceTwo 
  \tuplet 3/2 { fs8-\slurShapeB ^( a d } cs4) \tuplet 3/2 { f,8-\slurShapeC ^(
    a e' } ds4) |
  \tuplet 3/2 { e,8-\slurShapeD ^( a fs' } e4) \tupletOff \tuplet 3/2 { e,8-
    \slurShapeE ^( gs e' } d4) |
  
  \barNumberCheck 9
  \tuplet 3/2 { a,8^( e' cs' } a4) \tuplet 3/2 { a,8^( ds cs' } fss,4) |
  \tuplet 3/2 { gs,8^( ds' cs' } gs4) \tuplet 3/2 { gs,8^( ds' bs' } gs4) |
  \tuplet 3/2 { cs,8^( gs' e' } cs4) \tuplet 3/2 { es,8-\slurShapeF ^( b'! gs'
    } cs,4) |
  \tuplet 3/2 { fs,8-\slurShapeG ^( cs' a' } ds,4) \tuplet 3/2 { gs,8^( bs gs'
    } fs4) |
  % SrcB had 1st 8th as cs
  \tuplet 3/2 { e,8^( gs e' } cs4) \tuplet 3/2 { es,8-\slurShapeF ^( b'! gs'
    } cs,4) |
  \tuplet 3/2 { fs,8-\slurShapeG ^( cs' a' } ds,4) \tuplet 3/2 { gs,8^( bs gs'
    } fs4) |
  \tuplet 3/2 { cs,8^( gs' e' } cs4) \tuplet 3/2 { c,8-\slurShapeF ^( fs e' }
    as,4) |
  \tuplet 3/2 { b,8^( fs' e' } b4) \tuplet 3/2 { b,8^( fs' ds' } a!4) |
  
  \barNumberCheck 17
  \tuplet 3/2 { e8-\slurShapeF ^( b' gs' } ds4) \tuplet 3/2 { e,8-\slurShapeF 
    ^( as gs' } css,4) |
  \tuplet 3/2 { ds,8-\slurShapeF ^( as' gs' } ds4) \tuplet 3/2 { 
    cs,8-\slurShapeH ^( as' fss' } ds4) |
  \tuplet 3/2 { b,8^( ds ds' } gs,4) \tuplet 3/2 { cs,8-\slurShapeF ^( gs' e'
    } as,4) |
  \tuplet 3/2 { ds,8^( gs ds' } b4) \tuplet 3/2 { e,8-\slurShapeF ^( gs e' }
    b4) |
  \tuplet 3/2 { gs,8^( ds' b' } gs4) \tuplet 3/2 { cs,8^( e b' } gs4) |
  \stemUp  
  \tuplet 3/2 { ds,8( as' gs' } ds4) \tuplet 3/2 { ds,8( as' fss' } ds4) |
  \voiceTwo 
  \tuplet 3/2 { gs,8^( ds' bs' } gs4) \tuplet 3/2 { gs,8^( ds' bs' } gs4) |
  \tuplet 3/2 { gs,8^( cs as' } gs4) \tuplet 3/2 { gs,8^( e' as } gs4) |
  
  \barNumberCheck 25
  \tuplet 3/2 { gs,8^( ds' bs' } gs4) \tuplet 3/2 { gs,8^( ds' bs' } gs4) |
  \tuplet 3/2 { cs,8^( gs' e' } as,4) \tuplet 3/2 { ds,8^( fss ds' } cs4) |
  \tuplet 3/2 { gs,8^( ds' bs' } gs4) \tuplet 3/2 { gs,8^( ds' bs' } gs4) |
  \tuplet 3/2 { gs,8^( ds' bs' } gs4) \tuplet 3/2 { gs,8^( ds' bs' } gs4) |
  \oneVoice \tuplet 3/2 { cs,,8^( gs' cs } gs'4) r2 |
  R1 |
  \stemDown
  \tuplet 3/2 { fs,8( cs' a' } fs4) \tuplet 3/2 { fs,8( cs' as' } fs4) |
  \tuplet 3/2 { b,8-\slurShapeA ( fs' d' } gs,4) \tuplet 3/2 { cs,8( es cs' }
    b4) |
  
  \barNumberCheck 33
  \tuplet 3/2 { fs,8( cs' a' } fs4) \tuplet 3/2 { as,8( e'! cs' } fs,4) |
  \tuplet 3/2 { b,8-\slurShapeA ( fs' d' } gs,4) \tuplet 3/2 { cs,8( es cs' }
    b4) |
  \tuplet 3/2 { fs8-\slurShapeB ^( a d } cs4) \tuplet 3/2 { f,8-\slurShapeC ^(
    a e' } ds4) |
  \tuplet 3/2 { e,8-\slurShapeD ^( a fs' } e4) \tuplet 3/2 { e,8-\slurShapeE
    ^( gs e' } d4) |
  \tuplet 3/2 { a,8^( e' cs' } a4) \tuplet 3/2 { a,8^( ds cs' } fss,4) |
  \tuplet 3/2 { gs,8^( ds' cs' } gs4) \tuplet 3/2 { gs,8^( ds' bs' } gs4) |
  \tuplet 3/2 { cs,8^( gs' e' } cs4) \tuplet 3/2 { es,8-\slurShapeF ^( b'! gs'
    } cs,4) |
  \tuplet 3/2 { fs,8-\slurShapeG ^( cs' a' } ds,4) \tuplet 3/2 { gs,8^( bs gs'
    } fs4) |
  
  \barNumberCheck 41
  \tuplet 3/2 { cs,8^( gs' e' } cs4) \tuplet 3/2 { es,8-\slurShapeF ^( b'! gs'
    } cs,4) |
  \tuplet 3/2 { fs,8-\slurShapeF ^( cs' a' } ds,4) \tuplet 3/2 { gs,8^( bs gs'
    } fs4) |
  \tuplet 3/2 { cs,8^( gs' e' } cs4) \tuplet 3/2 { c,8-\slurShapeF ^( fs e' }
    as,4) |
  \tuplet 3/2 { b,8-\slurShapeF ^( fs' e' } b4) \tuplet 3/2 { b,8^( fs' ds' }
    a!4) |
  \tuplet 3/2 { e8-\slurShapeF ^( b' gs' } ds4) \tuplet 3/2 { e,8-\slurShapeF
    ^( as gs' } css,4) |
  \tuplet 3/2 { ds,8-\slurShapeF ^( as' gs' } ds4) \tuplet 3/2 { 
    cs,8-\slurShapeF^( fss e' } as,4) |
  \tuplet 3/2 { b,8^( ds ds' } gs,4) \tuplet 3/2 { cs,8-\slurShapeF ^( gs' e'
    } as,4) |
  \stemUp 
  \tuplet 3/2 { ds,,8( b' b' } ds,4) \stemDown \tuplet 3/2 { e,8^( b' b' }
    e,4) |
    
  \barNumberCheck 49
  \stemUp \tuplet 3/2 { gs,,8( ds' ds' } gs,4) \voiceTwo \tuplet 3/2 { cs,8(
    gs' gs' } as,4) |
  \tuplet 3/2 { ds,8( as' gs' } ds4) \stemUp \tuplet 3/2 { ds,8( as' fss' }
    ds4) |
  \stemDown 
  \tuplet 3/2 { gs,8^( ds' bs' } gs4) \tuplet 3/2 { gs,8^( ds' bs' } gs4) |
  \tuplet 3/2 { gs,8^( cs as' } gs4) \tuplet 3/2 { gs,8^( e' as } gs4) |
  % like 25
  \tuplet 3/2 { gs,8^( ds' bs' } gs4) \tuplet 3/2 { gs,8^( ds' bs' } gs4) |
  \tuplet 3/2 { cs,8^( gs' e' } as,4) \tuplet 3/2 { ds,8^( fss ds' } cs4) |
  \tuplet 3/2 { gs,8^( ds' bs' } gs4) \tuplet 3/2 { gs,8^( ds' bs' } gs4) |
  \tuplet 3/2 { gs,8^( ds' bs' } gs4)^\crescMarkup \tuplet 3/2 { gs,8^( fs' bs 
    } gs4) | 
  
  \barNumberCheck 57
  \key df \major
  \time 3/4
  \oneVoice <df, af' df>4 <ef af ef'> \voiceTwo r \oneVoice  |
  R2. |
  <f df' f>4 <gf df' gf> \voiceTwo r \oneVoice |
  R2. |
  <af, af'>4 q \voiceTwo r |
  \after 16 \< df4 s4.. s16\! |
  \oneVoice <af af'>4 q \voiceTwo r |
  df4~ \oneVoice <df df'> <c c'> |
  
  \barNumberCheck 65
  <bf bf'>4 <df df'> <ef ef'> |
  <af, af'>8. <ef' ef'>16 <af ef'>2 |
  <af, af'>4 <cf cf'> <df df'> |
  <gf, gf'>8. <df' df'>16 <gf df'>4 <df df'> |
  <gf df' gf>4 <ef gf'> f |
  \voiceTwo bf2 b8. c16~ |
  c4 c2 |
  \oneVoice <c af'>2 <c, c'>4 |
  
  \barNumberCheck 73
  \oneVoice <df af' df>4 <ef af ef'> \voiceTwo r \oneVoice  |
  R2. |
  <e b' e>4 <fs b fs'> \voiceTwo r \oneVoice |
  R2. |
  <af, af'>4 q \voiceTwo r |
  df4 s2 |
  \oneVoice <af af'>4 q \voiceTwo r |
  df4~ \oneVoice <df df'> <c c'> |
  
  \barNumberCheck 81
  <bf bf'>4 <df df'> <ef ef'> |
  <af, af'>8. <ef' ef'>16 <af ef'>4 \tupletOn \tuplet 5/4 { ef16( f ef bf 
    af)~ } |
  <af af'>4 <cf cf'> <df df'> |
  <gf, gf'>8. <df'df'>16 <gf df'>4 <df df'> |
  <gf df' gf>4 <ef gf'> f |
  \voiceTwo bf2 b8. c16~ |
  c4 c2 |
  \oneVoice <c af'>2 <c, c'>4 |
  
  \barNumberCheck 89
  \oneVoice <df af' df>4 <ef af ef'> \voiceTwo r \oneVoice  |
  R2. |
  <e b' e>4 <fs b fs'> \voiceTwo r \oneVoice |
  R2. |
  <af, af'>4 q \voiceTwo r |
  df4 s2 |
  \oneVoice  <c c'>4 q r^\stretto |
  \acciaccatura { f8 } g'8.( af16 c4) g16.( af32 c8)\noBeam |
  
  \barNumberCheck 97
  <af, af'>4 q r |
  \acciaccatura { df8 } e'8. f16 af4 s |
  af,,,4 <af af'>2 |
  <a a'>2. |
  \key fs \minor
  \time 4/4
  \tupletOff
  \slashedGrace { as8 } \stemDown \tuplet 3/2 { as'8-\slurShapeF ^( e' cs' }
    fs,4) \tuplet 3/2 { as,8-\slurShapeF ^( e' cs' } fs,4) |
  \tuplet 3/2 { b,8-\slurShapeF ^( fs' d' } gs,4) \tuplet 3/2 { cs,8^( es cs'
    } b4) |
  \tuplet 3/2 { fs,8-\slurShapeT ^( cs' a' } fs4) \tuplet 3/2 { as,8^( e'! cs'
    } fs,4) |
  \tuplet 3/2 { b,8-\slurShapeF ^( fs' d' } gs,4) \tuplet 3/2 { cs,8^( es cs'
    } b4) |
  
  \barNumberCheck 105
  \tuplet 3/2 { fs,8^( cs' a' } fs4) \tuplet 3/2 { e8-\slurShapeT ^( as fss' }
    cs4) |
  \tuplet 3/2 { cs,8-\slurShapeF ^( fss e' } as,4) \tuplet 3/2 { as,8^( e' cs'
    } g4) |
  \tuplet 3/2 { ds8-\slurShapeF ^( fs! fs' } b,4) \tuplet 3/2 { 
    fs8-\slurShapeF^( bs a' } ds,4) |
  \tuplet 3/2 { ds,8-\slurShapeF ^( a' fs' } bs,4) \tuplet 3/2 { bs,8^( fs'
    ds' } a4) |
  \tuplet 3/2 { b,8-\slurShapeF ^( d! d' } gs,4) \tuplet 3/2 { 
    a,8-\slurShapeF ^( cs cs' } fs,4) |
  \tuplet 3/2 { es,8^( cs' b' } gs4) \tuplet 3/2 { es,8^( cs' b' } gs4) |
  \tuplet 3/2 { fs,8^( cs' a' } fs4) \tuplet 3/2 { b,8^( d a' } fs4) |
  \voiceTwo 
  \tuplet 3/2 { cs8^( fs cs' } a4) \tuplet 3/2 { d,8^( fs fs' } gs,4) |
  
  \barNumberCheck 113
  \oneVoice \stemDown
  R1 * 2 |
  \tuplet 3/2 { cs,,8-\slurShapeF ^( fs' fs' } a,4) \tuplet 3/2 { 
    cs,8-\slurShapeF^( fs fs' } a,4) |
  \tuplet 3/2 { cs,8^( fs cs' } a4) \tuplet 3/2 { cs,8^( fs cs' } a4) |
  \tuplet 3/2 { cs,8-\slurShapeF ^( fs cs' } gs4) \tuplet 3/2 { 
    cs,8-\slurShapeF^( fs cs' } gs4) |
  \tuplet 3/2 { cs,8^( es cs' } gs4) \tuplet 3/2 { cs,8^( es cs' } gs4) |
  \tuplet 3/2 { cs,8-\slurShapeF ^( e! e' } gs,4) \tuplet 3/2 { gs,8^( ds' ds'
    } gs,4) |
  \tuplet 3/2 { b,8^( ds ds' } fs,4) \tuplet 3/2 { fs,8-\slurShapeF ^( cs' cs'
    } fs,4) |
  
  \barNumberCheck 121
  \tuplet 3/2 { fs,8^( bs a' } ds,4) \tuplet 3/2 { f,8^( bs a' } ds,4) |
  \tuplet 3/2 { e,8^( cs' a' } e4) \tuplet 3/2 { es,8^( b' gs' } \stemUp
    cs,4) \stemDown |
  \tuplet 3/2 { a8^( cs cs' } fs,4) \tuplet 3/2 { gs,8^( ds' ds' } gs,4) |
  \tuplet 3/2 { g,8^( es' es' } cs4) \tuplet 3/2 { fs,,8^( fs' fs' } cs4) |
  \tuplet 3/2 { <ds,, ds'>8^( fs' fs' } b,4) \tuplet 3/2 { <d,, d'>8^(
    fs' fs' } bs,4) |
  \tuplet 3/2 { <cs,, cs'>8^( fs' fs' } cs4) \stemUp \tuplet 3/2 { 
    <cs,,, cs'>8^( cs'' b' } es,4) |
  \tuplet 3/2 { <fs,, fs'>8^( cs'' a' } fs4) \stemDown \tuplet 3/2 { fs,8^( 
    cs' as' } fs4) |
  \tuplet 3/2 { fs,8^( d' b' } fs4) \tuplet 3/2 { fs,8^( b gs' } fs4) |
  
  \barNumberCheck 129
  \tuplet 3/2 { fs,8^( cs' as' } fs4) \tuplet 3/2 { fs,8^( cs' as' } fs4) |
  \tuplet 3/2 { b,8^( d gs } fs4) \tuplet 3/2 { cs,8^( cs' cs' } es,4) |
  \tuplet 3/2 { fs,8^( cs' as' } fs4) \tuplet 3/2 { fs,8^( cs' b' } es,4) |
  \tuplet 3/2 { fs,8^( cs' as' } fs4) \tuplet 3/2 { fs,8^( cs' b' } es,4) |
  \tuplet 3/2 { fs,8^( cs' as' } fs4) \tuplet 3/2 { fs,8^( cs' b' } es,4) |
  \tuplet 3/2 { fs,8^( cs' as' } fs4) \tuplet 3/2 { fs,8^( cs' b' } es,4) |
  \tuplet 3/2 { fs,8_>^( cs' as' } fs4) \tuplet 3/2 { es,8_>^( cs' as' } fs4) |
  \tuplet 3/2 { ds,8_>^( cs' as' } fs4) \tuplet 3/2 { cs,8_>^( cs' as' } fs4) |
  
  \barNumberCheck 137
  \stemUp fs,,4-. r \stemDown <fs' cs' fs cs'>2->\arpeggio\fermata |
}

leftHand = {
  \global
  \clef bass
  \mergeDifferentlyHeadedOn
  \mergeDifferentlyDottedOn
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override TextScript.Y-offset = -0.5
  \tag layout { s1 } \tag midi { s1\p } |
  s1 * 7 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s2 s\cresc |
  s1 |
  s2... s16\! |
  s1\f |
  s1 * 4 |
  
  \barNumberCheck 25
  s4 s2.\dim |
  s1 * 2 |
  s2... s16\! |
  s2\< s4..\> s16\! |
  s2.\< s8.\> s16\! |
  s1 * 2 |
  
  \barNumberCheck 33
  s1 * 8 |
  
  \barNumberCheck 41
  s1 * 2 |
  s2 s\cresc |
  s1 * 2 |
  s2... s16\! |
  s1\f |
  s1 |
  
  \barNumberCheck 49
  s1 |
  s2...\> s16\! |
  s1 * 2 |
  s4 s2.\dim |
  s1 |
  s2... s16\! |
  s2\< s4\> s\! |
  
  \barNumberCheck 57
  \time 3/4
  s2\f\< s4-\tweak extra-offset #'(-1 . -1.5) \p |
  s2. |
  s2\f\< s8\p s16.\< s32\! |
  s2 s8.\> s16\! |
  s2.\p |
  s2. |
  s2\p s8..\< s32\! |
  s2. |
  
  \barNumberCheck 65
  s2. * 3 |
  s4 s2\< |
  s2. |
  \override DynamicTextSpanner.style = #'none
  s8. s16\! s4 s-\tweak Y-offset 1 \cresc |
  s2. |
  s4..-\tweak Y-offset -1 \< s16\! s4 |
  
  \barNumberCheck 73
  s2. * 2 |
  s2 s8. s16\< |
  s8. s16\! s8 s4\> s8\! |
  s2. * 3 |
  s8.\> s16\! s2 |
  
  \barNumberCheck 81
  s2. * 4 |
  s2 s4\< |
  s8. s16\! s4 s\cresc |
  s2. |
  s2.^\rit |
  
  \barNumberCheck 89
  s2 s8-\tweak extra-offset #'(-1 . -2.5) \p s16 s\< |
  s8. s16\! s2 |
  s2. * 3 |
  s2\< s4\! |
  \revert DynamicTextSpanner.style
  s2.\cresc |
  s2 s8 s\! |
  
  \barNumberCheck 97
  s2.\ff |
  s2. * 2 |
  s16 s8.\> s4.. s16\! |
  \time 4/4
  \grace { s8 } s1\p |
  s1 * 3 |
  
  \barNumberCheck 105
  s1 |
  s2..\< s8\! |
  s1 * 6 |
  
  \barNumberCheck 113
  s1\> |
  s2. s4\! |
  s2 s\pp |
  s1 * 5 |
  
  \barNumberCheck 121
  s2 s\> |
  s2.. s8\! |
  s1\cresc |
  s2.. s8\! |
  s2 s8 s4.\> |
  s4. s8\! s2-\tweak to-barline ##f \< |
  s2..\> s8\! |
  s1 |
  
  \barNumberCheck 129
  s1 |
  s2. s4-\tweak Y-offset -5 ^\sempreP |
  s1 * 4 |
  s4 s2\< s8 s\! |
  \smorzSpanner s2....\startTextSpan s32\stopTextSpan |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \tempo "Andantino" 4 = 76
  s1 * 8 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 8 |
  
  \barNumberCheck 25
  s1 * 3 |
  \tempo 4 = 69
  s2 \tempo 4 = 63 s |
  \tempo 4 = 76
  s1 * 4 |
  
  \barNumberCheck 33
  s1 * 8 |
  
  \barNumberCheck 41
  s1 * 8 |
  
  \barNumberCheck 49
  s1 * 7 |
  \tempo 4 = 69
  s2 \tempo 4 = 63 s |
  
  \barNumberCheck 57
  \tempo "Più lento" 4 = 60
  \time 3/4
  s2. * 8 |
  
  \barNumberCheck 65
  s2. * 5 |
  s2 \tempo 4 = 66 s4 |
  s4 \tempo 4 = 72 s2 |
  \tempo 4 = 66
  s2 \tempo 4 = 60 s4 |
  
  \barNumberCheck 73
  s2. * 2 |
  \tempo 4 = 56
  s2. |
  \tempo 4 = 52
  s2. |
  \tempo 4 = 60
  s2. * 4 |
  
  \barNumberCheck 81
  s2. * 5 |
  s2 \tempo 4 = 66 s4 |
  s4 \tempo 4 = 72 s2 |
  \tempo 4 = 66
  s2 \tempo 4 = 60 s4 |
  
  \barNumberCheck 89
  s2. * 2 |
  \tempo 4 = 56
  s2. |
  \tempo 4 = 52
  s2. |
  \tempo 4 = 60
  s2. * 4 |
  
  \barNumberCheck 97
  s2. * 4 |
  \tempo "Tempo primo" 4 = 76
  \time 4/4
  \grace { s8 } s1
}

pedal = {
  s1 * 2 |
  s2\sd s4.\su\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s1 * 2 |
  
  \barNumberCheck 9
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |

  \barNumberCheck 17
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2..\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  
  \barNumberCheck 25
  s2..\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s1\sd |
  s2.. s8\su |
  s2\sd s\su |
  s1 |
  s2\sd s4.\su\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  
  \barNumberCheck 33
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s1 * 2 |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  
  \barNumberCheck 41
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s2-\tweak Y-offset -2 \sd s4.\su-\tweak Y-offset -2 \sd s8\su |
  
  \barNumberCheck 49
  s2\sd s4.\su-\tweak Y-offset -1 \sd s8\su |
  s2\sd \override SustainPedal.Y-offset = 1 s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2..\sd s8\su |
  \revert SustainPedal.Y-offset
  s2..\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s1\sd |
  s2.. s8\su |
  
  \barNumberCheck 57
  \time 3/4 
  s2. * 4 |
  s4.\sd s8\su s4 |
  s2\sd s4\su |
  s4.\sd s8\su s4 |
  s2. |
  
  \barNumberCheck 65
  s2. * 4 |
  s2 s8..\sd s32\su |
  s2. * 2 |
  s2\sd s8 s\su |
  
  \barNumberCheck 73
  s2. * 2 |
  s4\sd s\su\sd s\su |
  s2. |
  s2\sd s4\su |
  s4\sd s2\su |
  s4.\sd s8\su s4 |
  s2. |
  
  \barNumberCheck 81
  s2. * 4 |
  s2 s8..\sd s32\su |
  s2. * 2 |
  s2\sd s8 s\su |
  
  \barNumberCheck 89
  s2. * 4 |
  s2\sd s4\su |
  s4\sd s2\su |
  s2. |
  \grace { s8\sd } s4 s2\su |
  
  \barNumberCheck 97
  s4.\sd s8\su s4 |
  \grace { s8\sd } s2 s4\su |
  s2. * 2 |
  \time 4/4
  \grace { s8\sd } s2.. s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  
  \barNumberCheck 105
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s2\sd |
  
  \barNumberCheck 113
  s2... s16\su |
  s1 |
  s1-\tweak Y-offset -2 \sd |
  s1\su |
  s2..\sd s8\su |
  s2..\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |

  \barNumberCheck 121
  s2\sd s4.\su\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  \grace { s4.\sd } s2 s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s4.\sd s8\su s4.-\tweak Y-offset -2 \sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2..\sd s8\su |
  
  \barNumberCheck 129
  s2..\sd s8\su |
  s4.\sd s8\su s4.-\tweak Y-offset -1.5 \sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2-\tweak Y-offset -1 \sd s4\su-\tweak Y-offset -1 \sd s\su |

  \barNumberCheck 137
  s2..\sd s8\su |
}

forceBreaks = {
  % page 1
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\pageBreak
  
  % page 2
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\pageBreak
  
  % page 3
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 5 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 5 { s2.\noBreak } s2.\pageBreak
  
  % page 4
  \repeat unfold 5 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 4 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 5 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 5 { s2.\noBreak } s2.\break\noPageBreak
  \grace { s8 } \repeat unfold 4 { s2.\noBreak } s2.\pageBreak

  % page 5
  \repeat unfold 4 { s2.\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\pageBreak
  
  % page 6
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak  
}

nocturneTwoNotes =
\score {
  \header {
    title = "Nocturne Two"
    composer = "Frédéric Chopin"
    opus = "Opus 48, No. 2"
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
}

\include "articulate.ly"

nocturneTwoMidi =
\book {
  \bookOutputName "nocturne-op48-no2"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
