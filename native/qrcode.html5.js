var QRCodeGlue =  {
	Lsr : function( number, shiftBy ) {
		return number >>> shiftBy;
	},
	Lsl : function( number, shiftBy ) {
		return number << shiftBy;
	}
};