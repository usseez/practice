//-----------------------------------------------------------------
//	Testbench for add16 Module
//-----------------------------------------------------------------

module test_add16;

    reg  [15:0] a, b;			// reg type must be used inside "initial" block
    reg         cin;
    wire        cout, cout_golden;
    wire [15:0] sum, sum_golden;
    wire        eq_check;		// eq_check is the signal that is used to check
					// whether the results of the 2 systems are the same

    //--------------------------------------------------------------
    //	Input Vector Generation
    //--------------------------------------------------------------
    initial begin
        #10 {a, b, cin} = {16'h0001, 16'h0001, 1'b0};	// a=1, b=1, cin=0
        #10 {a, b, cin} = {16'h0001, 16'h0001, 1'b1};	// a=1, b=1, cin=1
        #10 {a, b, cin} = {16'h0003, 16'h0002, 1'b0};
        #10 {a, b, cin} = {16'h000a, 16'h0003, 1'b1};	// a=10, b=3, cin=1
        #10 {a, b, cin} = {16'h000f, 16'h0000, 1'b1};
        #10 {a, b, cin} = {16'hffff, 16'h0001, 1'b0};
        #10 {a, b, cin} = {16'h0010, 16'h0020, 1'b1};
        #10 {a, b, cin} = {16'hffff, 16'hffff, 1'b1};
    end

    //--------------------------------------------------------------
    //	DUT Instantiation
    //--------------------------------------------------------------
    add16        i_add16(a, b, cin, cout, sum);
    add16_golden i_add16_golden(a, b, cin, cout_golden, sum_golden);

    //--------------------------------------------------------------
    //	Output Monitoring
    //--------------------------------------------------------------
    assign eq_check = &( {cout, sum} ~^ {cout_golden, sum_golden} );

    initial
        $monitor("at time %t, a=%h, b=%h, cin=%b, eq_check=%b", $time, a, b, cin, eq_check);

endmodule
