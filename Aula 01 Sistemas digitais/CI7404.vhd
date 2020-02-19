entity CI7404 is
port(A1,A2,A3,A4,A5,A6: in bit;
     Y1,Y2,Y3,Y4,Y5,Y6: out bit);
end CI7404;

architecture CI of CI7404 is
begin

    Y1 <= not A1;
	 Y2 <= not A2;
	 Y3 <= not A3;
	 Y4 <= not A4;
	 Y5 <= not A5;
	 Y6 <= not A6;


end CI;