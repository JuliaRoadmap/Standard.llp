const lv_func = Level("函数定义",
	(st) -> begin
		tp!(st, 2, 2)
		grids=st.grids
		clear!(grids)
		grids[2, 2]=Info(docs(st, "5.md"))
		grids[7, 2]=grids[5, 6]=grids[6, 9]=Dice()
		grids[13, 14]=grids[15, 14]=grids[14, 15]=Wall()
		grids[14, 14]=Flag()
		grids[14, 13]=Lock() do st, v
			g1=grids[7, 2]
			g2=grids[5, 6]
			g3=grids[6, 9]
			if isa(g1, Dice) || isa(g2, Dice) || isa(g3, Dice)
				error("请掷完骰子")
			elseif v==num(g1)+num(g2)+num(g3)
				grids[15, 15]=Space()
				_draw(st)
			else
				error("错误！你只有一次机会")
			end
		end
	end
)
