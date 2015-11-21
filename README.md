elm-webmidi
===========

This is an experimental elm library for [Web-MIDI](http://www.w3.org/TR/webmidi/) input.  It provides signals for:

*   Connecting MIDI input devices
*   Disconnecting MIDI input devices
*   Sequences of NoteON/NoteOff messages coming from such a device

MIDI connectivity is started by ensuring that the init task runs. Devices that are connected already are treated as if they've newly connected.  There is no treatment of output devices, but this should be straightforward, following the same mechanisms as for input. 

n.b. I have little or no experience yet of javascript, elm or Web-MIDI and so the implementation is as simple-minded as I can make it.  The javascript is influenced by [this](http://www.keithmcmillen.com/blog/making-music-in-the-browser-web-midi-api/) introduction to Web-MIDI and by the elm [Mouse](https://github.com/elm-lang/core/blob/master/src/Native/Mouse.js) library implementation.

Note that at the time of writing, Chrome is the only browser to implememt the Web-Midi interface.



 




