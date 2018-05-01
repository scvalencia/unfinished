program pairfreq(input, output);
    const
        BLANK = ' ';
        NUM_WIDTH = 6;
    type
        letter = 'a'..'z';
        matrix = array[letter, letter] of integer;
    var
        ch, ch1, ch2 : letter;
        frequencies : matrix;
        currchar, prevchar : letter;

    procedure printFrequencies(var frequencies : matrix);
    begin

        write(BLANK : 2);

        for ch := 'a' to 'z' do
            write(BLANK : NUM_WIDTH - 1, ch);

        writeln;
        writeln;

        for ch1 := 'a' to 'z' do begin
            write(BLANK, ch1);
            for ch2 := 'a' to 'z' do
                write(frequencies[ch1][ch2] : NUM_WIDTH);
            writeln;
        end;
        
    end;

begin
    
    for ch1 := 'a' to 'z' do
        for ch2 := 'a' to 'z' do
            frequencies[ch1, ch2] := 0; 

    prevchar := BLANK;

    while not eof do begin
        read(currchar);
        if [prevchar, currchar] <= ['a'..'z'] then
            frequencies[currchar, prevchar] := frequencies[currchar, prevchar] + 1;
        prevchar := currchar;
    end;

    printFrequencies(frequencies);
    
end.