const lv_intro = Level("简介",
	(st) -> begin
		tp!(st, 7, 7)
		clear!(st.grids)
		st.grids[7, 7]=Info(docs(st, "1.md"))
		st.grids[10, 10]=Flag()
	end
)
