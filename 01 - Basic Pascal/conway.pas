program conway(input, output);

    const
        DEBUG = false;
        MATRIX_SIZE = 5;
        EMPTY_CELL_CHAR = ' ';
        OCCUPIED_CELL_CHAR = '*';

    type
        cellneighborhood = (U, UL, UR, L, R, D, DL, DR);
        neighborhoodactivity = set of cellneighborhood;
        
        cell = record
            ch : char;
            neighborhood : neighborhoodactivity;
        end;

        matrix = array[1..MATRIX_SIZE, 1..MATRIX_SIZE] of cell;

    var
        prevscheme, currscheme : matrix;
        i, j : integer;

    procedure initScheme(var scheme : matrix);
        var
            row, col : integer;
    begin

        for row := 1 to MATRIX_SIZE do
            for col := 1 to MATRIX_SIZE do
                with scheme[row, col] do begin

                    ch := EMPTY_CELL_CHAR;

                    if (row = 1) and (col = 1) then
                        neighborhood := [R, DR, D]
                    else if (row = 1) and (col = MATRIX_SIZE) then
                        neighborhood := [L, DL, D]
                    else if (row = MATRIX_SIZE) and (col = 1) then
                        neighborhood := [U, UR, R]
                    else if (row = MATRIX_SIZE) and (col = MATRIX_SIZE) then
                        neighborhood := [U, UL, L]

                    else if col = 1 then
                        neighborhood := [U, UR, R, DR, D]
                    else if col = MATRIX_SIZE then 
                        neighborhood := [UL, U, L, DL, D]
                    else if row = 1 then
                        neighborhood := [L, DL, D, DR, R]
                    else if row = MATRIX_SIZE then 
                        neighborhood := [UL, U, UR, L, R]

                    else
                        neighborhood := [U, UL, UR, L, R, D, DL, DR]

                end;

        { Reeplce with load from file }

        scheme[2, 2].ch := OCCUPIED_CELL_CHAR;
        scheme[2, 4].ch := OCCUPIED_CELL_CHAR;

        scheme[3, 2].ch := OCCUPIED_CELL_CHAR;
        scheme[3, 4].ch := OCCUPIED_CELL_CHAR;

        scheme[4, 2].ch := OCCUPIED_CELL_CHAR;
        scheme[4, 3].ch := OCCUPIED_CELL_CHAR;
        scheme[4, 4].ch := OCCUPIED_CELL_CHAR;

        (*
        scheme[2, 3].ch := OCCUPIED_CELL_CHAR;
        scheme[3, 3].ch := OCCUPIED_CELL_CHAR;
        scheme[4, 3].ch := OCCUPIED_CELL_CHAR;
        *)

    end;

    procedure printScheme(var scheme : matrix);
        var 
            i, j : integer;
            neighbor : cellneighborhood;
    begin

        for i := 1 to MATRIX_SIZE do begin
            for j := 1 to MATRIX_SIZE do
                with scheme[i, j] do 
                    write(ch, ' ');
            writeln;
        end;

        if DEBUG then begin
            for i := 1 to MATRIX_SIZE do begin
                for j := 1 to MATRIX_SIZE do begin
                    with scheme[i, j] do begin
                        write(i, ',', j, ': ');
                        for neighbor := U to DR do
                            if neighbor in neighborhood then
                                write(1, ' ')
                            else
                                write(0, ' ')
                    end;
                    writeln;
                end;
                
            end;
        end;
        
    end;

    procedure neighborhood2Index(cn : cellneighborhood; var i, j : integer);
    begin
        case cn of
            UL: begin i := i - 1; j := j - 1 end;
            U: i := i - 1;
            UR: begin i := i + 1; j := j + 1 end;
            L: j := j - 1;
            R: j := j + 1;
            DL: begin i := i + 1; j := j - 1 end;
            D: i := i + 1;
            DR: begin i := i + 1; j := j + 1 end; 
        end;
    end;

    procedure evolve(var prevscheme, nextscheme : matrix);
        var 
            i, j, row, col, occ : integer;
            neighbor : cellneighborhood;
    begin
        prevscheme := nextscheme;
        row := 0; col := 0;

        for i := 1 to MATRIX_SIZE do begin
            for j := 1 to MATRIX_SIZE do
                with prevscheme[i, j] do begin
                    occ := 0;
                    for neighbor := U to DR do begin
                        
                        if neighbor in neighborhood then begin
                            row := i;
                            col := j;

                            neighborhood2Index(neighbor, row, col);

                            if prevscheme[row, col].ch = OCCUPIED_CELL_CHAR then
                                occ := occ + 1;

                        end;
                    
                    end;

                    with nextscheme[i, j] do begin 
                        if (ch = OCCUPIED_CELL_CHAR) and (not ((2 <= occ) and (occ <= 3))) then
                            ch := EMPTY_CELL_CHAR
                        else if (ch = EMPTY_CELL_CHAR) and (occ = 3) then
                            ch := OCCUPIED_CELL_CHAR
                    end;
                end;
        end;
    end;

begin

    initScheme(currscheme);

    for i := 1 to 100 do begin
        printScheme(currscheme);
        evolve(prevscheme, currscheme);
    end;



    {initNeighborhoodActivity();}
    
end.