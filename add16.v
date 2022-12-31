//-----------------------------------------------------------------
//	16-bit Adder
//-----------------------------------------------------------------

module add16 (a, b, cin, cout, sum);

    input  [15:0] a, b;		// Input Operands
    input         cin;
    output        cout;
    output [15:0] sum;
    wire c1, c2, c3;
    //--------------------------------------------------
    add4 add4_0 (
    .a(a[3:0]), 
    .b(b[3:0]),
    .cin(cin),
    .sum(sum[3:0]),
    .cout(c1));
    
    add4 add4_1 (
    .a(a[7:4]), 
    .b(b[7:4]),
    .cin(c1),
    .sum(sum[7:4]),
    .cout(c2));
    
    add4 add4_2 (
    .a(a[11:8]), 
    .b(b[11:8]),
    .cin(c2),
    .sum(sum[11:8]),
    .cout(c3));
    
    add4 add4_3 (
    .a(a[15:12]), 
    .b(b[15:12]),
    .cin(c3),
    .sum(sum[15:12]),
    .cout(cout));
    
    //--------------------------------------------------

endmodule
