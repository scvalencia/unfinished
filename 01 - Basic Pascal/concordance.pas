program concordance(input, output);

    const
        TABLE_SIZE = 1000;
        MAX_WORD_LENGTH = 20;

    type
        charindex = 1..MAX_WORD_LENGTH;
        counttype = 1..MAXINT;
        tableindex = 1..TABLE_SIZE;
        wordtype = array[charindex] of char;
        entrytype = record
            worditem : wordtype;
            count : counttype; 
        end;
        tabletype = array[tableindex] of entrytype;

    var
        table : tabletype;
        entry, nextentry : tableindex;
        tablefull : boolean;
        letters : set of char;

    procedure readword(var buffer : wordtype);
        const
            BLANK = ' ';
        var
            charcount : 0..MAX_WORD_LENGTH;
            ch : char;

    begin
        if not eof then
            repeat
                read(ch);
            until (eof or (ch in letters));

        if not eof then begin
            charcount := 0;
            while ch in letters do begin
                if charcount < MAX_WORD_LENGTH then begin
                    inc(charcount);
                    buffer[charcount] := ch;
                end;

                if eof then ch := BLANK
                else read(ch);

            end;

            for charcount := charcount + 1 to MAX_WORD_LENGTH do
                buffer[charcount] := BLANK;

        end;
    end;

    procedure printword(buffer : wordtype);
        var
            charpos : 1..MAX_WORD_LENGTH;

    begin

        for charpos := 1 to MAX_WORD_LENGTH do
            write(buffer[charpos])
            
    end;


begin

    letters := ['a'..'z'];
    tablefull := false;
    nextentry := 1;

    while not (eof or tablefull) do begin
        readword(table[nextentry].worditem);
        if not eof then begin
            entry := 1;
            while table[entry].worditem <> table[nextentry].worditem do
                inc(entry);
            
            if entry < nextentry then
                inc(table[entry].count)
            else if nextentry < TABLE_SIZE then begin
                inc(nextentry);
                table[entry].count := 1;
            end;
        end;
    end;

    if tablefull then
        writeln('The table is not large enough.')
    else
        for entry := 1 to nextentry - 1 do
            with table[entry] do begin
                printword(worditem);
                writeln(count);
            end
end.