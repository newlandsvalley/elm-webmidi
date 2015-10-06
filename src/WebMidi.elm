module WebMidi 
   ( MidiConnect
   , MidiNote
   , MidiDisconnect
   , midiInputS
   , midiDisconnectS
   , midiNoteS
   , defaultNote
   , defaultInput
   ) where

{-|  Library for  working with midi input devices,

# Definition
@docs WebMidi

# Data Types
@docs MidiNote, MidiConnect, MidiDisconnect

# Signals
@docs midiInputS, midinoteS, midiDisconnectS

# defaults
@docs defaultNote, defaultInput

-}

-- native WebMidi implementation
import Native.WebMidi
import Signal exposing (Signal)

{-| Representation of a basic MIDI note message which indicates whether it is being switched on or off,
    the pitch, and the velocity (e.g. keyboard pressure).  (Velocity of 0 is synonymous with note off)
    sourceId is the identity of the owning input device that produced the note
-}
type alias MidiNote =
  { noteOn    : Bool
  , pitch     : Int
  , velocity  : Int
  , timestamp : Int
  , sourceId  : String
  }

{-| A Midi Connection - could be used for both input and output devices but only inputs are currently supported -}
type alias MidiConnect =
  { portType     : String 
  , id           : String 
  , manufacturer : String 
  , name         : String 
  , version      : String 
  }

{-| A Midi Disconnection of a device previously connected -}
type alias MidiDisconnect =
  { portType     : String 
  , id           : String 
  }


defaultNote : MidiNote
defaultNote = 
  { noteOn = False
  , pitch = 0
  , velocity = 0
  , timestamp = 0
  , sourceId = ""
  }

defaultInput : MidiConnect
defaultInput = 
  { portType = ""
  , id = ""
  , manufacturer = ""
  , name = "no device connected"
  , version = ""
  }


{-| The midi note signal. -}
midiNoteS: Signal MidiNote
midiNoteS =  
   Native.WebMidi.note

{-| The input connect signal. -}
midiInputS: Signal MidiConnect
midiInputS =
   Native.WebMidi.connect

{-| The disconnect signal. -}
midiDisconnectS: Signal MidiDisconnect
midiDisconnectS =
   Native.WebMidi.disconnect



