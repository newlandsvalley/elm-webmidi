import WebMidi exposing (..)
import Signal
import Signal exposing (..)
import Html exposing (..)
import List exposing (..)
import Graphics.Element exposing (..)

type MidiMessage = MC MidiConnect | MN MidiNote | MD MidiDisconnect

-- Model
type alias MidiInputState = 
   { midiInput: MidiConnect
   , noteM: Maybe MidiNote
   }

type alias MidiState = List MidiInputState

defaultMidiMessage : MidiMessage
defaultMidiMessage = MC defaultInput

defaultMidiState : MidiState
defaultMidiState = []

-- Merged signals
notes : Signal MidiMessage
notes = Signal.map MN midiNoteS

inputs : Signal MidiMessage
inputs = Signal.map MC midiInputS

disconnects : Signal MidiMessage
disconnects = Signal.map MD midiDisconnectS

midiMessages : Signal MidiMessage
midiMessages = mergeMany [inputs, notes, disconnects]

-- step function to change state after each incoming message
stepMidi : MidiMessage -> MidiState -> MidiState
stepMidi mm ms = 
   case mm of 
     -- an incoming MIDI input connection - add it to the list
     MC midiConnect -> 
        { midiInput = midiConnect, noteM = Nothing } :: ms
     -- an incoming note - find the appropriate MIDI iput id and add the note to it
     MN midiNote ->
        let updateInputState inputState =
          if midiNote.sourceId == inputState.midiInput.id 
            then 
              { inputState | noteM <- Just midiNote }
            else 
              inputState          
        in
           List.map updateInputState ms     
     -- a disconnect of an existing input - remove it from the list
     MD midiDisconnect ->
        List.filter (\is -> is.midiInput.id /= midiDisconnect.id) ms

-- VIEW
viewNote : MidiNote -> String
viewNote mn = "noteOn:" ++ (toString mn.noteOn) ++ ",pitch:" ++ (toString mn.pitch) ++ ",velocity:" ++ (toString mn.velocity)

viewPortAndNote : MidiInputState -> Html
viewPortAndNote mis = 
   case mis.noteM of 
     Nothing ->
        li [] [ text mis.midiInput.name]
     Just min ->
        li [] [ text ( mis.midiInput.name ++ ": " ++ (viewNote min)) ]

view : MidiState -> Html
view ms =
  div []
    [ let inputs = List.map viewPortAndNote ms
      in ul [] inputs
    ] 

-- Main
midiState : Signal MidiState
midiState = Signal.foldp stepMidi defaultMidiState midiMessages

main : Signal Html
main = Signal.map view midiState
   
{-   
showMsg : MidiMessage -> Html
showMsg msg = 
   case msg of 
     MI min -> 
        p [] [ text min.name ]
     MN note -> 
        p [] [ text (toString note.pitch) ]


main : Signal Html
main =
  Signal.map showMsg midiMessages
-}
              

