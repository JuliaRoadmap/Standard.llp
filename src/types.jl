struct Flag<:Cell end
_show(st, ::Flag, x, y)= fill_image(st, "flag", x+9, y+2)

struct Info<:Cell s end
_show(st, ::Info, x, y)= fill_image(st, "info", x+11, y+2)
function ev_enter(st, c::Info)
	if !st.formal
		print(term(c.s))
	end
end

struct Dice<:Cell end
_show(st, ::Info, x, y)= fill_image(st, "dice", x+4, y+4)
ev_enter(st, ::Dice)= st.grids[st.x, st.y]=NumCell(rand(1:6))

struct Lock<:Cell
	onguess::Function
end
_solid(::Lock)=true
_show(st, ::Info, x, y)= fill_image(st, "lock", x+3, y+3)
function _send(st, ::Lock, ::Val{:guess}, v)
	i.onguess(st, v)
end

mutable struct Box<:Cell
	data::Vector
	color::RGB
	color2::RGB
end
_solid(::Box)=true
function _show(st, c::Box, x, y)
	ctx=st.context
	set_source_rgb(ctx, 0.0, 0.0, 0.0)
	rectangle(ctx, x+3, y+3, 26, 26)
	fill(ctx)
	set_source_rgb(ctx, c.color.r, c.color.g, c.color.b)
	rectangle(ctx, x+4, y+4, 24, 24)
	fill(ctx)
	set_source_rgb(ctx, 0.0, 0.0, 0.0)
	rectangle(ctx, x+4, y+9, 24, 1)
	fill(ctx)
	set_source_rgb(ctx, c.color2.r, c.color2.g, c.color2.b)
	rectangle(ctx, x+14, y+8, 4, 3)
	fill(ctx)
end
_look(c::Box)=c.data
