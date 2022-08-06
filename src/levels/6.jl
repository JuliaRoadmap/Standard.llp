const lv_vector = Level(
	(st) -> begin
		tp!(st, 2, 2)
		grids=st.grids
		pr=st.private
		clear!(grids)
		grids[2, 2]=Info(docs(st, "6.md"))

		v1=Vector(undef, 2)
		v1[2]=pr[:v1]=rand(0:255)
		grids[4, 2]=Box(v1, r8(157,213,234), r8(0,162,232))
		grids[10, 2]=Box(Vector(undef, 1), r8(0,162,232), R8(157,213,234))

		v2=Vector(undef, 2)
		v2[1]=pr[:v2]=rand(0:255)
		grids[4, 4]=Box(v2, r8(181,230,29), r8(34,177,76))
		grids[10, 4]=Box([1], r8(34,177,76), r8(181,230,29))

		v3=rand(-127:128, rand(5:7))
		pr[:len]=length(v3)
		pr[:sum]=sum(v3)
		pr[:max]=maximum(v3)
		pr[:min]=minimum(v3)
		grids[4, 6]=Box(v3, r8(185,122,87), r8(136,0,21))
		grids[10, 6]=Box([], r8(136,0,21), r8(185,122,87))
	end,
	(st) -> begin
		grids=st.grids
		pr=st.private
		if length(grids[4,2].data)!=1 || grids[10,2].data[2]!=pr[:v1]
			println("第一组不符合要求")
		elseif length(grids[4,4].data)!=2 || grids[10,4].data!=[pr[:v2]]
			println("第二组数据不符合要求")
		elseif length(grids[4,6].data)!=pr[:len] || grids[10,6].data!=[pr[:sum],pr[:max],pr[:min]]
			println("第三组数据不符合要求")
		else
			return true
		end
		return false
	end
)
