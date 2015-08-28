Elm.Native.WebMidi = {};

Elm.Native.WebMidi.make = function(localRuntime) {
    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.WebMidi = localRuntime.Native.WebMidi || {};
    if (localRuntime.Native.WebMidi.values) return localRuntime.Native.WebMidi.values;

    var Utils = Elm.Native.Utils.make(localRuntime);
    var NS = Elm.Native.Signal.make(localRuntime);

    var note = NS.input('WebMidi.note', Utils.Tuple2(0,0));


    var init = connect()

    function connect () {
      // request MIDI access and then connect
      if (navigator.requestMIDIAccess) {
         navigator.requestMIDIAccess({
           sysex: false // this defaults to 'false' and we won't be covering sysex in this article. 
         }).then(onMIDISuccess, onMIDIFailure);
      } else {
        console.log("No MIDI support in your browser.");
      }
    }

    // midi functions
    function onMIDISuccess(midiAccess) {
        // when we get a succesful response, run this code
        console.log('MIDI Access Object', midiAccess);

        midi = midiAccess
        var inputs = midi.inputs.values();
        // loop over any inputs and listen for data
        for (var input = inputs.next(); input && !input.done; input = inputs.next()) {
          input.value.onmidimessage = onMIDIMessage;
        }  
    }

    function onMIDIFailure(e) {
        // when we get a failed response, run this code
        console.log("No access to MIDI devices or your browser doesn't support WebMIDI API. Please use WebMIDIAPIShim " + e);
    }


    function onMIDIMessage(event){
        var data = event.data, 
        cmd = data[0] >> 4,
        channel = data[0] & 0xf,
        type = data[0], // ignore [inconsistent between devices]
        pitch = data[1], 
        velocity = data[2];
        noteOn = velocity > 0
	
        //	log('data', data, 'cmd', cmd, 'channel', channel);
        console.log('pitch', pitch, " velocity", velocity); 
        localRuntime.notify(note.id, Utils.Tuple2(pitch,velocity));
    }

 
    return localRuntime.Native.WebMidi.values = {
        note: note
    };
};

