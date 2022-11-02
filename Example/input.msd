
// -------------------------------------------------------------
// MolSpin input file generated by VIKING
// -------------------------------------------------------------

SpinSystem RPSystem
{
	
	// ---------------------------------------------------------
	// Spins
	// ---------------------------------------------------------
	Spin RPElectron1
	{
		spin = 1/2;
		type = electron;
		tensor = isotropic(2);
	}
	
	Spin RPElectron2
	{
		spin = 1/2;
		type = electron;
		tensor = isotropic(2);
	}
	
	Spin N10
	{
		spin = 1;
		tensor = isotropic(0.8)+matrix("0.01 0 0;0 0.5 0;0 0 0.189");
	}
	
	Spin N5
	{
		spin = 1;
		tensor = isotropic(0.5)+matrix("-1.5 0 0;0 -1.6 0;0 0 0.507");
	}
	
	
	// ---------------------------------------------------------
	// Interactions
	// ---------------------------------------------------------
	Interaction zeeman1
	{
		type = zeeman;
		spins = RPElectron1,RPElectron2;
		prefactor = 0.001;
		field = "0.0 0.0 0.05";
	}
	
	Interaction radical1hyperfine
	{
		type = hyperfine;
		group1 = RPElectron1;
		prefactor = 0.001;
		//tensor = isotropic(1);
		group2 = N10, N5;
	}
	
	
	// ---------------------------------------------------------
	// Spin States
	// ---------------------------------------------------------
	State singlet
	{
		spins(RPElectron1,RPElectron2) = |1/2,-1/2> - |-1/2,1/2>;
	}
	
	State t0
	{
		spins(RPElectron1,RPElectron2) = |1/2,-1/2> + |-1/2,1/2>;
	}
	
	State tp
	{
		spin(RPElectron1) = |1/2>;
		spin(RPElectron2) = |1/2>;
	}
	
	State tm
	{
		spin(RPElectron1) = |-1/2>;
		spin(RPElectron2) = |-1/2>;
	}
	
	State pm
	{
		spin(RPElectron1) = |1/2>;
		spin(RPElectron2) = |-1/2>;
	}
	
	State mp
	{
		spin(RPElectron1) = |-1/2>;
		spin(RPElectron2) = |1/2>;
	}
	
	State identity
	{
	}
	
	
	// ---------------------------------------------------------
	// Transitions
	// ---------------------------------------------------------
	Transition Product0
	{
		rate = 0.001;
		source = identity;
		type = sink;
	}
	
	Transition Product1
	{
		rate = 0.001;
		source = singlet;
		type = sink;
	}
	
	
	// ---------------------------------------------------------
	// SpinSystem Properties
	// ---------------------------------------------------------
	Properties properties
	{
		initialstate = singlet;
	}
}


Settings
{
	// ---------------------------------------------------------
	// General settings
	// ---------------------------------------------------------
	Settings general
	{
		steps = 18;
	}
	
	// ---------------------------------------------------------
	// Actions
	// ---------------------------------------------------------
	Action scan
	{
		value = 10.0;
		vector = RPSystem.zeeman1.field;
		type = rotatevector;
		axis = "0 1 0";
	}
	
	// ---------------------------------------------------------
	// Outputs
	// ---------------------------------------------------------
	Output orientation
	{
		type = vectorangle;
		vector = RPSystem.zeeman1.field;
		reference = "0 0 1";
	}
	Output fieldstrength
	{
		type = length;
		vector = RPSystem.zeeman1.field;
	}
	Output components
	{
		type = components;
		vector = RPSystem.zeeman1.field;
	}
	
}

Run
{
	Task main
	{
		type = StaticSS;
		datafile = "results.dat";
		timestep = 0.01;
		totaltime = 100.0;
	}
}
