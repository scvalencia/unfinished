program palindromic(input, output);

    const
        MAX_BUFFER_LENGTH = 100;
        BUFFER_TERMINATOR = '-';
        

    type
        digit = 0..9;
        bufferindex = 1..MAX_BUFFER_LENGTH;
        buffer = array[bufferindex] of char;

    var
        n : integer;
        i : bufferindex;
        str : buffer;

    procedure printbuffer(str : buffer);
        var
            i : bufferindex;
    begin

        for i := 1 to MAX_BUFFER_LENGTH do
            if str[i] = BUFFER_TERMINATOR then
                break
            else
                write(str[i]);

    end;

    procedure tobinstring(n : integer; var str : buffer);
    begin 
        writeln; 
    end;

    procedure tostring(var num : integer; var str : buffer);
        var
            i : bufferindex;
            remainder : digit;
    begin
        num := 574785;
        writeln('****', num);
        i := 1;
        while true do begin
            remainder := num mod 10;
            num := num div 10;
            str[i] := chr(ord('0') + remainder);
            inc(i);
            write(remainder, ' ');
            if num = 0 then
                break;
        end;
        writeln('****', num);
    end;

begin
    n := 574785;

    for i := 1 to MAX_BUFFER_LENGTH do
        str[i] := BUFFER_TERMINATOR;

    tostring(n, str);
    {printbuffer(str);}
    writeln;

    for i := 1 to MAX_BUFFER_LENGTH do
        str[i] := BUFFER_TERMINATOR;
    
end.