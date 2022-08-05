module LL_Standard
include("types.jl")
include("shortcuts.jl")
end # module
([
	"4"=>Level("异常处理",1,1,
	()->begin
		fill!(grids::Matrix,nothing)
		grids[1,1]=Info(md"""
		""")
		val=rand(1:10)
		grids[1,2]=Lock(
			(i::Lock,v)->begin
				if v==val
					grids[1,2]=nothing
					grids[1,2+v]=Flag()
					_draw()
					return nothing
				else
					throw(false)
				end
			end
		)
	end,()->begin
		return isa(grids[plyx,plyy],Flag)
	end),
	"5"=>Level("函数定义",2,2,
	()->begin
		fill!(grids::Matrix,nothing)
		grids[2,2]=Info(md"""
		""")
		grids[7,2]=grids[5,6]=grids[6,9]=Dice()
		grids[15,15]=Lock(
			(i::Lock,v)->begin
				if isa(grids[7,2],Int)&&isa(grids[5,6],Int)&&isa(grids[6,9],Int)&&v==grids[7,2]+grids[5,6]+grids[6,9]
					grids[15,15]=nothing
					_draw()
					return nothing
				else
					throw("提交失败，你只有一次机会")
				end
			end
		)
	end,
	()->begin
		return grids[15,15]===nothing
	end),
	"6"=>Level("数组使用",2,2,
	()->begin
		fill!(grids::Matrix,nothing)
		grids[2,2]=Info(md"""
# 信息
这里有一些箱子，它们支持与一维数组（`Vector`）相同的操作
# 目标
对于以下三组箱子，分别完成
1. 取出左箱末尾数据，并塞入右箱末尾
2. 读出左箱开头数据，并替换右箱开头为该数据
3. 读取左出数据，将数据的和、最大值、最小值依次从末尾推入右箱
# 示例
```jl
function task1()
	v=pop!(look(4,2))
	east(6)
	push!(look(10,2),v)
end
```

!!! note
	你不能移动到箱子上\
	请严格按照要求执行
		""")

		v1=Vector(undef,2)
		v1[2]=private[:v1]=rand(0:255)
		grids[4,2]=Box(v1,R8(157,213,234),R8(0,162,232))
		grids[10,2]=Box(Vector(undef,1),R8(0,162,232),R8(157,213,234))

		v2=Vector(undef,2)
		v2[1]=private[:v2]=rand(0:255)
		grids[4,4]=Box(v2,R8(181,230,29),R8(34,177,76))
		grids[10,4]=Box([1],R8(34,177,76),R8(181,230,29))

		v3=rand(-127:128,rand(5:7))
		private[:len]=length(v3)
		private[:sum]=sum(v3)
		private[:max]=maximum(v3)
		private[:min]=minimum(v3)
		grids[4,6]=Box(v3,R8(185,122,87),R8(136,0,21))
		grids[10,6]=Box([],R8(136,0,21),R8(185,122,87))
	end,
	()->begin
		if length(grids[4,2].data)!=1 println("你应该【取出】第一组左箱末尾数据")
		elseif grids[10,2].data[2]!=private[:v1] println("第一组不符合要求")
		elseif length(grids[4,4].data)!=2 println("你应该【读出】第二组左箱开头数据")
		elseif grids[10,4].data!=[private[:v2]] println("第二组数据不符合要求")
		elseif length(grids[4,6].data)!=private[:len] println("你应该【读出】第三组左箱数据")
		elseif grids[10,6].data!=[private[:sum],private[:max],private[:min]] println("第三组数据不符合要求")
		else return true end
		return false
	end)
],
()->begin
	cd(@__DIR__)
	cd("../img/")
	load_imgsource("flag","flag.png")
	load_imgsource("info","info.png")
	load_imgsource("dice","dice.png")
	load_imgsource("lock","lock.png")
	load_imgsource("ply","ply.png")
end
)
