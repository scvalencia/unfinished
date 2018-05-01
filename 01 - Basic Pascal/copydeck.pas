program copydeck;
    const
        MAX_COL = 80;
        BLANK = ' ';

    type
        colindex = 1..MAX_COL;
        card = array[colindex] of char;
        cardfile = file of card;

    var
        indeck, outdeck : cardfile;
        buffer, blankcard : card;
        column : colindex;
begin
    assign(indeck, 'copydeck.input.txt');
    assign(outdeck, 'copydeck.output.txt');

    reset(indeck);
    rewrite(outdeck);

    while not eof(indeck) do begin
        read(indeck, buffer);
        if buffer <> BLANK then
            write(outdeck, buffer)
    end;

end.