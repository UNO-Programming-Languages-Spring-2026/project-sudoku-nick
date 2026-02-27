% sudoku1b.lp -- define subgrid/3 for 4x4 (2x2 blocks), plus keep 1a if you want.

row(1..4).
col(1..4).
cell(X,Y) :- row(X), col(Y).

% Compute block coordinates (0 or 1) using integer division
bx(X,BX) :- row(X), BX = (X-1) / 2.
by(Y,BY) :- col(Y), BY = (Y-1) / 2.

% Subgrid id: G = 2*BX + BY + 1  -> values 1..4
subgrid(X,Y,G) :- cell(X,Y), bx(X,BX), by(Y,BY), G = 2*BX + BY + 1.

#show subgrid/3.