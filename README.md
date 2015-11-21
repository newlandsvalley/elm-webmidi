elm-WebMidi
===========

This is an experimental elm library for [Web-MIDI](http://www.w3.org/TR/webmidi/) input.  It provides signals for:

*   Connecting input MIDI devices
*   Disconnecting input MIDI devices
*   Sequences of NoteON/NoteOff messages coming from such a device

When an elm-WebMidi program loads, devices that are connected already are treated as if they've newly connected.  There is no treatment of output devices, but this should be straightforward, following the same mechanisms as for input. 

n.b. I have little or no experience yet of javascript, elm or Web-MIDI and so the implementation is as simple-minded as I can make it.  The javascript is influenced by [this](http://www.keithmcmillen.com/blog/making-music-in-the-browser-web-midi-api/) introduction to Web-MIDI and by the elm [Mouse](https://github.com/elm-lang/core/blob/master/src/Native/Mouse.js) library implementation.

Note that at the time of writing, Chrome is the only browser to implememt the Web-Midi interface.

Issues
------

At the moment, if you import WebMidi, then initialisation of connected MIDI devices happens automatically.  This is not necessarily the right thing to do, but was made necessary under Elm 0.15 because of [this issue](https://github.com/elm-lang/core/issues/240) (fixed in Elm 0.16).  I think it is probably preferable to have an explicit init() method, which is in fact what I've done in an embedded version of elm-webmidi [here](https://github.com/newlandsvalley/elm-soundfont).

 




