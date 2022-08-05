const lv_error = Level("异常处理",
	(st) -> begin
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
				return nothing
			else
				error("<error>")
			end
		end
	end
)
