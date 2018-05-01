program tonerows(input, output);

    const
        {Length of a tone row}
        rowlength = 12;

    type
        {Twelfe tones of a chromatic octave}
        tonevalues = 1..rowlength;
        {Tones in a tone row, which consists of several tones}
        row = set of tonevalues;

    var
        seed, counter, cycles : integer;
        tone : tonevalues;
        sequence : row;

    procedure randomtone(var randomtone : tonevalues; var randval : integer);
    begin
        randomtone := randval div (65536 div rowlength) + 1;
        randval := (25173 * randval + 13949) mod 65536;
    end;

begin
    read(cycles, seed);

    for counter := 1 to cycles do begin
        sequence := [];

        repeat
            
            randomtone(tone, seed);
            if not (tone in sequence) then begin
                write(tone);
                sequence := sequence + [tone];
            end

        until sequence = [1..rowlength];
        writeln;

    end;
end.