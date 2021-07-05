module compare_74ls85 (
	input A3, A2, A1, A0, B3, B2, B1, B0, IAGB, IALB, IAEB,
	output reg FAGB, FALB, FAEB
);

wire [3:0] DataA, DataB;
assign DataA = {A3, A2, A1, A0};
assign DataB = {B3, B2, B1, B0};

always @(*) begin
	if (DataA > DataB) begin				/* A > B  */
		FAGB = 1; FALB = 0; FAEB = 0;
	end

	else if (DataA < DataB) begin			/* A < B */
		FAGB = 0; FALB = 1; FAEB = 0;
	end	

	else if (IAGB & !IALB & !IALB) begin	/* A = B & (A' > B')  */
		FAGB = 1; FALB = 0; FAEB = 0;
	end

	else if (!IAGB & IALB & IALB) begin		/* A = B & (A' < B')  */
		FAGB = 0; FALB = 1; FAEB = 0;
	end

	else if (IAEB) begin					/* A = B & (A' = B')  */
		FAGB = 0; FALB = 0; FAEB = 1;
	end

	else if (IAGB & IALB & !IAEB) begin		/* A = B & (A' != B')  */
		FAGB = 0; FALB = 0; FAEB = 0;
	end

	else if (!IAGB & !IALB & !IAEB) begin	/* A = B & ?  */
		FAGB = 1; FALB = 1; FAEB = 0;
	end
end

endmodule
