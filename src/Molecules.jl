module Molecules

using Unitful
using PeriodicTable
using LinearAlgebra

import PhysicalConstants.CODATA2018: a_0

export Atom

bohr_to_angstrom = convert(Float64, a_0 / 1u"Å")

struct Atom{I,F}
    Z::I
    mass::F
    xyz::Vector{F}
end

# For checking if two atoms are the same
function Base.:(==)(A1::Atom, A2::Atom)
    A1.Z    == A2.Z    && 
    A1.mass == A2.mass &&
    A1.xyz  == A2.xyz
end

# Alias for a vector of atoms
Molecule = Vector{A} where A <: Atom

include("Parse.jl")
# include("Manipulations.jl")
include("Properties.jl")
# include("RotationalEnergy.jl")
# include("PointGroup.jl")

end # module
