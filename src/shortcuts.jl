function tp!(st, x, y)
	st.x=x
	st.y=y
end
chkpos(st, x, y)= (st.x==x && st.y==y)
function docs(st, fname)
	str = cd(joinpath(@__DIR__, "../docs")) do
		read(fname, String)
	end
	return st.private[:mdparser](str)
end
function r8(r::Int, g::Int, b::Int)
	r0=reinterpret(N0f8, UInt8(r))
	g0=reinterpret(N0f8, UInt8(g))
	b0=reinterpret(N0f8, UInt8(b))
	RGB{N0f8}(r0, g0, b0)
end
