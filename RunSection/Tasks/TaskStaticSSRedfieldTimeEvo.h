#ifndef MOD_RunSection_TaskStaticSSRedfieldTimeEvo
#define MOD_RunSection_TaskStaticSSRedfieldTimeEvo

#include "BasicTask.h"
#include "SpinAPIDefines.h"

namespace RunSection
{
	class TaskStaticSSRedfieldTimeEvo : public BasicTask
	{
		private:
			double timestep;
			double totaltime;
			SpinAPI::ReactionOperatorType reactionOperators;
			
			void WriteHeader(std::ostream&);	// Write header for the output file
			bool RedfieldtensorTimeEvo(const arma::cx_mat& _op1, const arma::cx_mat& _op2, const arma::cx_mat& _specdens,arma::cx_mat& _redfieldtensor); //Contruction of Redfieldtensor with operator basis
			bool ConstructSpecDensGeneralTimeEvo(const int& _spectral_function, const std::vector<double>& _ampl_list, const std::vector<double>& _tau_c_list,const arma::cx_mat& _domega, arma::cx_mat& _specdens);
			bool ConstructSpecDensSpecificTimeEvo(const int& _spectral_function, const std::complex<double>& _ampl, const std::complex<double>& _tau_c,const arma::cx_mat& _domega, arma::cx_mat& _specdens);

			
		protected:
			bool RunLocal() override;
			bool Validate() override;
			
		public:
			// Constructors / Destructors
			TaskStaticSSRedfieldTimeEvo(const MSDParser::ObjectParser&, const RunSection&);	// Normal constructor
			~TaskStaticSSRedfieldTimeEvo();													// Destructor
	};
}

#endif
