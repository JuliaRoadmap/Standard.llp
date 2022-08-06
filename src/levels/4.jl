const lv_error = Level() do st
	tp!(st, 1, 1)
	grids=st.grids
	clear!(grids)
	grids[1, 1]=Info(docs(st, "4.md"))
	val=rand(1:10)
	grids[1, 2] = Lock() do st, v
		if v==val
			grids[1, 2]=Space()
			grids[1, 2+v]=Flag()
			_draw(st)
		else
			error("<error>")
		end
	end
end
