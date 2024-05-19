library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package Comp_package is
	
component ProgramCounter is
	port (
		CLK    : in STD_LOGIC;
		Reset  : in STD_LOGIC:= ('0');
		PC_in  : in STD_LOGIC_VECTOR(31 downto 0);
		PC_out : out STD_LOGIC_VECTOR(31 downto 0):= (others => '0')
	);
end component;

component InstructionMemory is
    Port ( 	
	clk : in std_logic;
           address : in STD_LOGIC_VECTOR(31 downto 0);
           instruction : out STD_LOGIC_VECTOR(31 downto 0));
end component; 

component ControlUnit is
    Port ( 
        opcode : in STD_LOGIC_VECTOR(5 downto 0); -- Opcode field of the instruction
        RegDst : out STD_LOGIC;  -- Register destination   0
        ALUSrc : out STD_LOGIC;  -- ALU source				1 
        MemtoReg : out STD_LOGIC;  -- Memory to register	2
        RegWrite : out STD_LOGIC;  -- Register write enable	 3
        MemRead : out STD_LOGIC;  -- Memory read enable		  4
        MemWrite : out STD_LOGIC;  -- Memory write enable	   5
        Branch : out STD_LOGIC;  -- Branch instruction			6
		AlUOp : out std_logic_vector(5 downto 0) 				--   7 8 9
    );
end component;	 

component mux5bit is	 
	port(
	a,b: in std_logic_vector(4 downto 0);
	s:in std_logic:='0';
	c : out std_logic_vector(4 downto 0)
	);			   
	
end component;

component ProgramCounterAdder is
	port (
		PCA_in  : in STD_LOGIC_VECTOR(31 downto 0);
		PCA_out : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component RegisterFile is
    Port (
        clkr,clkw : in STD_LOGIC;
        regWrite : in STD_LOGIC;
		
        writeReg : in STD_LOGIC_VECTOR(4 downto 0);   
		
        writeData : in STD_LOGIC_VECTOR(31 downto 0);  
		
        readReg1 : in STD_LOGIC_VECTOR(4 downto 0);
        readReg2 : in STD_LOGIC_VECTOR(4 downto 0);	
		
        readData1 : out STD_LOGIC_VECTOR(31 downto 0);
        readData2 : out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

component SignExtender is
	port (
		SE_in  : in STD_LOGIC_VECTOR(15 downto 0);
		SE_out : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component MUX is	 
	port(
	a,b: in std_logic_vector(31 downto 0);
	s:in std_logic;
	c : out std_logic_vector(31 downto 0)
	);
end component; 

component ALU is
    Port (	   
        operation : in STD_LOGIC_VECTOR(5 downto 0) ;-- Control input for selecting operation
        operand1 : in STD_LOGIC_VECTOR(31 downto 0); -- First operand
        operand2 : in STD_LOGIC_VECTOR(31 downto 0); -- Second operand
        result : out STD_LOGIC_VECTOR(31 downto 0);  -- Result of the operation
        zero : out STD_LOGIC                         -- Zero flag indicating result is zero
    );
end component; 

component ALU_Control is
    Port (
        funct : in STD_LOGIC_VECTOR(5 downto 0);  -- Function field of the instruction (for R-type instructions)
        ALUOp : in STD_LOGIC_VECTOR(5 downto 0);   -- ALU operation field (determined by the instruction type)
        ALUControl : out STD_LOGIC_VECTOR(5 downto 0)  -- Control signals for the ALU
    );
end component; 

component DataMemory is
    port ( 
			clk : in std_logic;
		Address    : in  STD_LOGIC_VECTOR (31 downto 0);
		Write_Data : in  STD_LOGIC_VECTOR (31 downto 0);
		MemRead    : in  STD_LOGIC;
		MemWrite   : in  STD_LOGIC;
		Read_Data  : out  STD_LOGIC_VECTOR (31 downto 0)
	 );
end component;	  

component Shift2Left is
	port (
	S_IN  : in STD_LOGIC_VECTOR(31 downto 0);
	S_out : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component adder is
	port (
		add_in1,add_in2   : in STD_LOGIC_VECTOR(31 downto 0);
		add_out : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;	

component andgate is
	port (
	a, b: in std_logic;
	c: out std_logic
	);
end component;

end Comp_package;