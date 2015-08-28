elm-WebMidi
===========

This is an experimental elm library for Web-MIDI input.  The intention is to be able to attach an input device such as a MIDI keyboard and receive a succession of MIDI note-on and note-off messages as an elm Signal. Each message in the signal is a pair of integers representing the note's pitch and velocity.

n.b. I have little or no experience yet of javascript, elm or Web-MIDI and so the implementation is as simple-minded as I can make it.  The javascript is influenced by [this](http://www.keithmcmillen.com/blog/making-music-in-the-browser-web-midi-api/) introduction to Web-MIDI and by the elm [Mouse](https://github.com/elm-lang/core/blob/master/src/Native/Mouse.js) library implementation.

Note, too that at the time of writing, Chrome is the only browser to implememt the Web-Midi interface.

 




