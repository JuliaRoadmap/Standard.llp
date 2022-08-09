module LL_Standard
using Main.LightLearn
include("types.jl")
include("shortcuts.jl")

Level(initializer)=Level(initializer, st -> isa(st.grids[st.x, st.y], Flag))
include("levels/1.jl")
include("levels/2.jl")
include("levels/3.jl")
include("levels/4.jl")
include("levels/5.jl")
include("levels/6.jl")

function init(st)
	cd(joinpath(@__DIR__, "../assets/images")) do
		load_imgsources(st)
	end
end

const levels = [
	"简介" => lv_intro,
	"条件的使用" => lv_state,
	"循环的使用" => lv_loop,
	"异常处理" => lv_error,
	"函数定义" => lv_func,
	"数组使用" => lv_vector,
]

end # module
