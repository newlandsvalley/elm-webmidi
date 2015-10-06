import WebMidi exposing (..)
import Graphics.Element exposing (..)

main : Signal Element
main =
  Signal.map show midiNoteS
              

