library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fetch is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CUentrada : in  STD_LOGIC_VECTOR(1 downto 0);
           Entradain : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruccionout : out  STD_LOGIC_VECTOR (31 downto 0);
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end fetch;

architecture Behavioral of fetch is

COMPONENT Sumador32bit
	PORT(
			  Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;
	

COMPONENT PC
	PORT(
			  inPC : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           outPC : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	

COMPONENT IM
	PORT(
			  Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	

COMPONENT Mux2
	PORT(
			  Entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           sumador : in  STD_LOGIC_VECTOR (31 downto 0);
           Cuentrada : in  STD_LOGIC_VECTOR (1 downto 0);
           posicion : out  STD_LOGIC_VECTOR (31 downto 0)
		 );
		END COMPONENT;			

signal a2,a3,a5,a35: std_logic_vector(31 downto 0); 


begin
	

	ints_NPC: PC PORT MAP(
	
           inPC => a35,
           Reset => Reset,
           Clk => Clk,
           outPC => a2
	);
	
	ints_PC: PC PORT MAP(
	
			  inPC => a2,
           Reset => Reset,
           Clk => Clk,
           outPC => a5
          
	);
	
	PCout<=a5;
	ints_sum: Sumador32bit PORT MAP(
	
			  Oper1 => a5,
			  Reset => Reset,
			  Oper2 =>"00000000000000000000000000000001",
           Result => a3
          
	);
	
	ints_Mux2: Mux2 PORT MAP(
	
			  Entrada => Entradain,
           sumador => a3,
           Cuentrada => CUentrada,
           posicion=> a35
          
	);
	
	ints_IM: IM PORT MAP(
	
			  Address => a5,
           Reset => Reset,
           Instruction =>Instruccionout
          
	);
	

end Behavioral;

