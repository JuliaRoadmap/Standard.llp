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

const levels = Dict{String, Dict{String, Level}}(
	"基础" => Dict{String, Level}(
		"简介" => lv_intro,
		"条件的使用" => lv_state,
		"循环的使用" => lv_loop,
		"异常处理" => lv_error,
		"函数定义" => lv_func,
		"数组使用" => lv_vector,
	)
)

end # module
