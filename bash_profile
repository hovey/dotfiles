# This is a local "dotfiles" version of ~/.bash_profile.
# So that this file is sourced, the ~/bash_profile should contain the following lines
#
# # Source dotfiles bash_profile if it exists
# if [ -f ~/dotfiles/bash_profile ]; then
#     source ~/dotfiles/bash_profile
# fi# 

# 2025-08-25 New build of autotwin needs the hdf5 library
# After brew installation
# brew install hdf5
# the environment variables must be set
# HDF5 configuration
export HDF5_DIR=$(brew --prefix hdf5)
export HDF5_LIBRARY_PATH=$(brew --prefix hdf5)/lib
export HDF5_INCLUDE_PATH=$(brew --prefix hdf5)/include

# Announce HDF5 variables are set
echo "✓ HDF5 environment variables set:"
echo "  HDF5_DIR: $HDF5_DIR"
echo "  HDF5_LIBRARY_PATH: $HDF5_LIBRARY_PATH"
echo "  HDF5_INCLUDE_PATH: $HDF5_INCLUDE_PATH"

