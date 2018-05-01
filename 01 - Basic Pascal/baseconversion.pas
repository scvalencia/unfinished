program baseconversion(input, output);
    const
        MAX_RADIX = 10;
        MAX_LEN = 32;
    type
        radix = 2..MAX_RADIX;
    var
        datum : integer;
        scale : radix;

    procedure tobase(num : integer; base : radix);
        var
            jp, kp : 0..MAX_LEN;
            buffer : array[1..MAX_LEN] of char;
    begin {tobase}

        if num < 0 then begin
            write('-');
            num := abs(num);
        end;

        kp := 0;

        repeat
            inc(kp);
            buffer[kp] := chr(num mod base + ord('0'));
            num := num div base;
        until (num = 0);

        for jp := kp downto 1 do
            write(buffer[jp]);
    end; {tobase}

begin
    read(datum);

    for scale := 2 to MAX_RADIX do begin
        tobase(datum, scale);
        writeln;
    end;
    
end.