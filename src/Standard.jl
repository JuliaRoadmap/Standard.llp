module LL_Standard
include("types.jl")
include("shortcuts.jl")

include("levels/1.jl")
include("levels/2.jl")
include("levels/3.jl")
include("levels/4.jl")
include("levels/5.jl")
include("levels/6.jl")

function __init__()
	cd(joinpath(@__DIR__, "../assets")) do
		load_imgsources("images")
	end
end

const levels = [
	lv_intro, lv_state, lv_loop, lv_error, lv_func, lv_vector,
]

end # module
