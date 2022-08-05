const lv_intro = Level("简介",
	(st) -> tp!(st, 7, 7),
	(st) -> begin
		initial!(st.grids)
		grids[7,7]=Info(docs(st, "1.md"))
		grids[10,10]=Flag()
	end,
	(st) -> chkpos(st, 10, 10)
)
