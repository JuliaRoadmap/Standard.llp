const lv_state = Level("条件的使用",
	(st) -> begin
		tp!(st, 7, 7)
		grids=st.grids
		clear!(grids)
		grids[7, 7]=Info(docs(st, "2.md"))
		grids[7, 8]=Dice()
		grids[7, 10]=Flag()
		grids[10, 8]=Flag()
	end,
	(st) -> begin
		v=st.grids[7, 8]
		if isa(v, Dice)
			println("先掷骰子！")
			return false
		else
			return num(v)&2==1 ? chkpos(st, 10, 8) : chkpos(st, 7, 10)
		end
	end
)
