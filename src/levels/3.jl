const lv_loop = Level() do st
	tp!(st, 1, 1)
	grids=st.grids
	clear!(grids)
	@inbounds for i in 2:15
		for j in 2:2:14
			grids[i, j]=Wall()
		end
	end
	grids[1, 2]=grids[1, 6]=grids[1, 10]=grids[1, 14]=grids[16, 4]=grids[16, 8]=grids[16, 12]=Wall()
	grids[1, 1]=Info(docs(st, "3.md"))
	grids[1, 16]=Flag()
end
