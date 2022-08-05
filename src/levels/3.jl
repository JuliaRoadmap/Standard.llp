const lv_loop = Level("循环的使用",
	(st) -> begin
		tp!(st, 1, 1)
		grids=st.grids
		initial!(grids)
		@inbounds for i in 2:15
			for j in 2:2:14
				grids[i, j]=Solid()
			end
		end
		grids[1, 2]=grids[1, 6]=grids[1, 10]=grids[1, 14]=grids[16, 4]=grids[16, 8]=grids[16, 12]=Solid()
		grids[1, 1]=Info(docs(st, "3.md"))
		grids[1, 16]=Flag()
	end,
	(st) -> chkpos(st, 1, 16)
)
