struct Flag end
show_grid(ctx::DContext,::Flag,x::Int,y::Int)=fill_image(ctx,"flag",x+9,y+2)

struct Info s::Markdown.MD end
function plyenter(i::Info)
	if !formal
		display(i.s)
	end
end
show_grid(ctx::DContext,::Info,x::Int,y::Int)=fill_image(ctx,"info",x+11,y+2)

struct Dice end
function plyenter(::Dice)
	grids[plyx,plyy]=rand(1:6)
end
show_grid(ctx::DContext,::Dice,x::Int,y::Int)=fill_image(ctx,"dice",x+4,y+4)

struct Lock
	onguess::Function
end
solid(::Lock)=true
show_grid(ctx::DContext,::Lock,x::Int,y::Int)=fill_image(ctx,"lock",x+3,y+3)
_look(::Lock)=nothing
function _send(i::Lock,::Val{:guess},v)
	i.onguess(i,v)
end

mutable struct Box
	data::Vector
	color::RGB
	color2::RGB
end
solid(::Box)=true
function show_grid(ctx::DContext,i::Box,x::Int,y::Int)
	set_source_rgb(ctx,0.0,0.0,0.0)
	rectangle(ctx,x+3,y+3,26,26)
	fill(ctx)
	set_source_rgb(ctx,i.color.r,i.color.g,i.color.b)
	rectangle(ctx,x+4,y+4,24,24)
	fill(ctx)
	set_source_rgb(ctx,0.0,0.0,0.0)
	rectangle(ctx,x+4,y+9,24,1)
	fill(ctx)
	set_source_rgb(ctx,i.color2.r,i.color2.g,i.color2.b)
	rectangle(ctx,x+14,y+8,4,3)
	fill(ctx)
end
_look(i::Box)=i.data
