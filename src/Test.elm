import WebMidi
import Graphics.Element exposing (..)


main : Signal Element
main =
  Signal.map show WebMidi.note

