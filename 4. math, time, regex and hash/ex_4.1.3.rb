str = "1.24e6"
float = str.to_f
new_str = float.to_s
p float, new_str

# p Math.sqrt(-1) # produces a out of domain error

TAU = 2 * Math::PI
TAU.to_s
p TAU
TAU = 5 # reassigning a constant results in a warning
p TAU
