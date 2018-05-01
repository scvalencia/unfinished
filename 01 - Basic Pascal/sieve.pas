program sieve(input, output);
    const
        FIRST_PRIME = 2;
        MAXIMUM = 100000000;
    var
        primes : array[FIRST_PRIME..MAXIMUM] of boolean;
        leftin, range, factor, multiple : 0..MAXIMUM;
begin
    read(range);

    for factor := FIRST_PRIME to range do
        primes[factor] := true;

    leftin := range - FIRST_PRIME + 1;
    factor := FIRST_PRIME - 1;

    repeat
        inc(factor);

        if primes[factor] then begin
            writeln(factor);
            for multiple := 1 to range div factor do
                if primes[factor * multiple] then begin
                    primes[factor * multiple] := false;
                    dec(leftin);
                end;
        end;
    until (leftin = 0);
    
end.