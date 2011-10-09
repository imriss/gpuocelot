/*! \file   AggressivePredication.h
	\author Gregory Diamos <gregory.diamos@gatech.edu>
	\date   Saturday October 8, 2011
	\brief  The header file for the AggressivePredicationPass class.
*/

#pragma once

// Ocelot Includes
#include <ocelot/transforms/interface/Pass.h>

namespace transforms
{

/*! \brief Uses heuristics to duplicate blocks and add them to hyperblocks */
class AggressivePredicationPass : public KernelPass
{
public:
	AggressivePredicationPass(unsigned int maxBlockSize = 0);

public:
	/*! \brief Initialize the pass using a specific module */
	void initialize(const ir::Module& m);
	/*! \brief Run the pass on a specific kernel in the module */
	void runOnKernel(ir::IRKernel& k);
	/*! \brief Finalize the pass */
	void finalize();

};

}


	
