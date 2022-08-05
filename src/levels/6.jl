const lv_vector = Level("数组使用",
	(st) -> begin
		tp!(st, 2, 2)
		grids=st.grids
		clear!(grids)
		grids[2, 2]=Info(docs(st, "6.md"))
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
	(st) -> begin
		if length(grids[4,2].data)!=1 println("你应该【取出】第一组左箱末尾数据")
		elseif grids[10,2].data[2]!=private[:v1] println("第一组不符合要求")
		elseif length(grids[4,4].data)!=2 println("你应该【读出】第二组左箱开头数据")
		elseif grids[10,4].data!=[private[:v2]] println("第二组数据不符合要求")
		elseif length(grids[4,6].data)!=private[:len] println("你应该【读出】第三组左箱数据")
		elseif grids[10,6].data!=[private[:sum],private[:max],private[:min]] println("第三组数据不符合要求")
		else return true end
		return false
	end
)
