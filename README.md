elm-webmidi
===========

deprecated as from elm 0.17
---------------------------

This comment from Evan:

> Sorry to keep this in limbo for so long. I am moving towards the plan outlined [here](https://groups.google.com/forum/#!searchin/elm-dev/native/elm-dev/1JW6wknkDIo/H9ZnS71BCAAJ) and discussed a bit further in [the 0.17 announcement](http://elm-lang.org/blog/farewell-to-frp#what-is-next-).

> Ultimately, I think this kind of stuff should live in elm-lang/midi so I think the right way to proceed is to design a fully Task based API that just does low-level bindings in a module called Midi.LowLevel. Similar to how elm-lang/websocket has WebSocket.LowLevel that can be used to define any sort of effect manager.

in response:

The possibility of wrapping the web platform API is gradually becoming a reality. The rules for wrapping native javascript are changing; Signals have vanished.  It is not yet clear to me how Evan wishes to involve the community in this project.

for elm 0.16
------------

This is an experimental elm library for [Web-MIDI](http://www.w3.org/TR/webmidi/) input compatible with elm 0.16.  It makes quite full use of signals, providing them for:

*   Connecting MIDI input devices
*   Disconnecting MIDI input devices
*   Sequences of NoteON/NoteOff messages coming from such a device

To start, ensure that the init task runs - this sets up MIDI connectivity. Devices that are connected already are treated as if they've newly connected.  There is no treatment of output devices, but this should be straightforward, following the same mechanisms as for input. 

It uses a (now) old-fashioned Native interface to the Web-MIDI platform API.  This will no longer be supported in forthcoming elm releases.  However, there is still no indication as to how interfaces to the web platform API will be accomplished in any future release of elm.

Note that at the time of writing, Chrome is the only browser to implememt the Web-Midi interface.

for elm 0.18
------------

I waited for over a year for half-promises about documenting Effect Managers or about wrapping the web platform API to come to fruition, but nothing happened. So in the end, as a temporary measure, I moved this project to [elm-webmidi-ports](https://github.com/newlandsvalley/elm-webmidi-ports).  I am _still_ waiting patiently to see the web platform API supported natively in Elm along the lines suggested by Evan in his note above.  There appears to be very little interest.



 




