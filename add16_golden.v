//-----------------------------------------------------------------
//	16-bit Adder (Golden Model)
//-----------------------------------------------------------------

module add16_golden (a, b, cin, cout, sum);

    input  [15:0]  a, b;
    input          cin;
    output         cout;
    output [15:0]  sum;

    assign {cout, sum} = a + b + cin;	// Don't use "+" operator in your code.

endmodule
