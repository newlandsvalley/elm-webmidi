elm-webmidi
===========

This is an experimental elm library for [Web-MIDI](http://www.w3.org/TR/webmidi/) input compatible with elm 0.16.  It makes quite full use of signals, providing them for:

*   Connecting MIDI input devices
*   Disconnecting MIDI input devices
*   Sequences of NoteON/NoteOff messages coming from such a device

To start, ensure that the init task runs - this sets up MIDI connectivity. Devices that are connected already are treated as if they've newly connected.  There is no treatment of output devices, but this should be straightforward, following the same mechanisms as for input. 

It uses a (now) old-fashioned Native interface to the Web-MIDI platform API.  This will no longer be supported in forthcoming elm releases.  However, there is still no indication as to how interfaces to the web platform API will be accomplished in any future release of elm.

Note that at the time of writing, Chrome is the only browser to implememt the Web-Midi interface.



 




