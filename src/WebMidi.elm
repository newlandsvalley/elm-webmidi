module WebMidi 
   ( note
   ) where

{-|  Library for  working with midi input devices,

# Note
@docs note

-}

-- native WebMidi implementation
import Native.WebMidi
import Signal exposing (Signal)

{-| The current midi note. -}
note : Signal (Int,Int)
note =
    Native.WebMidi.note


