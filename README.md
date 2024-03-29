# chopin-opus-48
[LilyPond](https://lilypond.org/) engraving source files used to create Chopin's Two Nocturnes, opus 48.

## Creating the PDF and MIDI files
(I highly recommend the [Frescobaldi](https://www.frescobaldi.org/) IDE for LilyPond.  It makes all of the following much easier.)

The PDF and MIDI files can be created by issuing the following command in the directory this file is in (assuming you have `lilypond` in your PATH variable):

        lilypond nocturnes-op48-book.ly

To create a smaller PDF, try:

        lilypond -dno-point-and-click nocturnes-op48-book.ly

You may also [download the latest release](https://github.com/ksnortum/chopin-opus-48/releases/latest) to get the compiled PDF and MIDI files.

### Two-sided printing
The pieces are set up so that they can be printed on two sides of the paper, leaving an extra margin amount on the inside pages for binding.  If you don't want this, open the file `header-paper.ily`,
find the `\paper` block (in the middle) and set `two-sided = ##f`.

### Errors and warnings while compiling
You will see several warnings and two programming errors if you compile the source files.  In Nocturne 1, you will this:

    programming error: cyclic dependency: calculation-in-progress encountered for VerticalAxisGroup.adjacent-pure-heights
    continuing, cross fingers

This is caused by a bug in LilyPond and there is no good way around it.  It can be ignored.

In Nocturne 2 you will see two things.  First, a warning:

    warning: stealing the entirety of a note's time

This comes from the script `articulate.ly`.  It will try to "stealing" time from a previous note when realizing grace notes and warn you if it takes all of the note's time.  You will also see several barcheck warnings:

    warning: barcheck failed at: 3/4

This comes from a bug in the `articulate.ly` script.  If you have a grace note immediately after a time meter change, bar line checks will fail.

If you wish to eliminate the warnings when compiling the second nocturne, you can do so by removing the `articulate` function.  In the file `nocturne-op48-no2-parts.ily`, near the bottom of the file, you will see this line:

    \articulate <<

Remove the `\articutate` part so that the line is simply `<<`.  The warnings will go away, but the MIDI output will suffer.

## Thanks
Thanks to all the folks at the [LilyPond user's mailing list](mailto://lilypond-user@gnu.org) for all the help getting LilyPond to do what I wanted.

## License
This work is licensed under the [Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/) from Creative Commons.  Follow the link for details.  Basically, you can use this work however you want *if* you keep the same license and you attribute the work to me, Knute Snortum (knute (at) snortum (dot) net).

