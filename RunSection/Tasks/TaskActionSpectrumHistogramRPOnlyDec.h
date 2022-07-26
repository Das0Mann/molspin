/////////////////////////////////////////////////////////////////////////
// TaskActionSpectrumHistogram (RunSection module)
// ------------------
// Computes the action-spectrum histogram of an uncoupled radical pair, see Hiscock et al. (2017) and Leberecht et al. (2022).
// 
// Molecular Spin Dynamics Software - developed by Claus Nielsen.
// Task implemented by Siu Ying Wong and Luca Gerhards.
// (c) 2022 Quantum Biology and Computational Physics Group.
// See LICENSE.txt for license information.
/////////////////////////////////////////////////////////////////////////
#ifndef MOD_RunSection_TaskActionSpectrumHistogramRPOnlyDec
#define MOD_RunSection_TaskActionSpectrumHistogramRPOnlyDec

#include "SpinSpace.h"
#include "BasicTask.h"

namespace RunSection
{
	class TaskActionSpectrumHistogramRPOnlyDec : public BasicTask
	{
		private:
			// Data members
			
			// Private methods
			arma::vec GetHistogramBinCenters();
			void WriteHeader(std::ostream&);	// Write header for the output file
			
		protected:
			bool RunLocal() override;
			bool Validate() override;
			
		public:
			// Constructors / Destructors
			TaskActionSpectrumHistogramRPOnlyDec(const MSDParser::ObjectParser&, const RunSection&);	// Normal constructor
			~TaskActionSpectrumHistogramRPOnlyDec();													// Destructor
	};
}

#endif
