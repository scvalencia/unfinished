program bubblesort(input, output);
    const
        ARRAY_LENGTH = 10;
    type
        vector = array[0..ARRAY_LENGTH - 1] of integer;
    var
        bucket : vector;
        i : integer;

    procedure swap(var a, b : integer);
        var
            temp : integer;
    begin
        temp := a;
        a := b;
        b := temp;
    end;

    procedure sort(var bucket : vector);
        var
            i, j : integer;
            swapped : boolean;
    begin
        
        repeat
            swapped := false;

            for i := 1 to ARRAY_LENGTH - 1 do
                if bucket[i - 1] > bucket[i] then begin
                    swap(bucket[i - 1], bucket[i]);
                    swapped := true;
                end;
            
        until (not swapped);

    end;

    procedure printarray(var bucket : vector);
        var
            i : integer;
    begin
        
        for i := 0 to ARRAY_LENGTH - 1 do
            write(bucket[i], ' ');

        writeln;

    end;

begin

    bucket[0] := 9;
    bucket[1] := 8;
    bucket[2] := 1;
    bucket[3] := 7;
    bucket[4] := 6;
    bucket[5] := 3;
    bucket[6] := 4;
    bucket[7] := 5;
    bucket[8] := 4;
    bucket[9] := 1;

    printarray(bucket);
    sort(bucket);
    printarray(bucket);
    
end.