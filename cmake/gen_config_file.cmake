# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
#
# Helper function to create a config.mak for use by depending projects
#
# Usage:
#
#       gen_config_file(<output> <prefix>)
#
function(gen_config_file OUTPUT PREFIX)
	file(WRITE  ${OUTPUT} "OE_CONFIGURED=1\n")
	#file(APPEND ${OUTPUT} "OE_DISTRONAME=\n")
	file(APPEND ${OUTPUT} "OE_MAJOR=${PROJECT_VERSION_MAJOR}\n")
	file(APPEND ${OUTPUT} "OE_MINOR=${PROJECT_VERSION_MINOR}\n")
	file(APPEND ${OUTPUT} "OE_REVISION=${PROJECT_VERSION_PATCH}\n")
	file(APPEND ${OUTPUT} "OE_VERSION=${PROJECT_VERSION}\n")
	file(APPEND ${OUTPUT} "OE_PREFIX=${PREFIX}\n")
	file(APPEND ${OUTPUT} "OE_LIBDIR=$(OE_PREFIX)/${CMAKE_INSTALL_LIBDIR}\n")
	file(APPEND ${OUTPUT} "OE_BINDIR=$(OE_PREFIX)/${CMAKE_INSTALL_BINDIR}\n")
	file(APPEND ${OUTPUT} "OE_DATADIR=$(OE_PREFIX)/${CMAKE_INSTALL_DATADIR}\n")
	file(APPEND ${OUTPUT} "OE_INCLUDEDIR=$(OE_PREFIX)/${CMAKE_INSTALL_INCLUDEDIR}\n")
        if(USE_LIBSGX)
            file(APPEND ${OUTPUT} "OE_USE_LIBSGX=1\n")
        else()
            file(APPEND ${OUTPUT} "OE_USE_LIBSGX=0\n")
        endif()
endfunction(gen_config_file)
