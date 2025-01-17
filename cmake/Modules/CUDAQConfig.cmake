# ============================================================================ #
# Copyright (c) 2022 - 2023 NVIDIA Corporation & Affiliates.                   #
# All rights reserved.                                                         #
#                                                                              #
# This source code and the accompanying materials are made available under     #
# the terms of the Apache License 2.0 which accompanies this distribution.     #
# ============================================================================ #

get_filename_component(CUDAQ_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

include(CMakeFindDependencyMacro)
list(APPEND CMAKE_MODULE_PATH "${CUDAQ_CMAKE_DIR}")

set (CUDAQSpin_DIR "${CUDAQ_CMAKE_DIR}")
find_dependency(CUDAQSpin REQUIRED)

set (CUDAQCommon_DIR "${CUDAQ_CMAKE_DIR}")
find_dependency(CUDAQCommon REQUIRED)

set (CUDAQEmQir_DIR "${CUDAQ_CMAKE_DIR}")
find_dependency(CUDAQEmQir REQUIRED)

set (CUDAQPlatformDefault_DIR "${CUDAQ_CMAKE_DIR}")
find_dependency(CUDAQPlatformDefault REQUIRED)

set (CUDAQNlopt_DIR "${CUDAQ_CMAKE_DIR}")
find_dependency(CUDAQNlopt REQUIRED)

set (CUDAQEnsmallen_DIR "${CUDAQ_CMAKE_DIR}")
find_dependency(CUDAQEnsmallen REQUIRED)

get_filename_component(PARENT_DIRECTORY ${CUDAQ_CMAKE_DIR} DIRECTORY)
set (NVQIR_DIR "${PARENT_DIRECTORY}/nvqir")
find_dependency(NVQIR REQUIRED)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED on)

enable_language(CUDAQ)

if(NOT TARGET cudaq::cudaq)
    include("${CUDAQ_CMAKE_DIR}/CUDAQTargets.cmake")
endif()
