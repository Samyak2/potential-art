### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 426b5c90-7c3f-11eb-3f2f-9dde1b32247f
using Luxor, Colors

# ╔═╡ d1c962e0-7c44-11eb-3d44-458c17db2497
using PlutoUI

# ╔═╡ 549df61e-7c3f-11eb-084e-c569635b421c
function barnsley_fern(n, hueshift=false)
	🐢 = Turtle()
	Penup(🐢)
	Pencolor(🐢, "green")
	
	p = Point(0, 0)
	for i in 1:n
		Reposition(🐢, Point((65p.x - 10), -(37p.y - 180)))
		Circle(🐢, 0.5)
		if hueshift
			HueShift(🐢, 0.0005)
		end
		prob = rand()
		if prob < 0.01
			p = Point(0, 0.16p.y)
		elseif prob < 0.86
			p = Point(0.85p.x + 0.04p.y, -0.04p.x + 0.85p.y + 1.6)
		elseif prob < 0.93
			p = Point(0.2p.x - 0.26p.y, 0.23p.x + 0.22p.y + 1.6)
		else
			p = Point(-0.15p.x + 0.28p.y, 0.26p.x + 0.24p.y + 0.44)
		end
	end
end

# ╔═╡ e523e4f0-7c44-11eb-3ec5-5fb18d2e5b46
@bind n Slider(1:1000:200000)

# ╔═╡ 624affb4-7c3f-11eb-382c-ff02831d8a5f
@png barnsley_fern(n) 400 400 "barnsley_fern.png"

# ╔═╡ 03178496-7c48-11eb-17a2-0933ef395323
@png barnsley_fern(n, true) 400 400 "barnsley_fern_he.png"

# ╔═╡ b3f0fd0a-7c3f-11eb-1639-31ab166f1b37
rand()

# ╔═╡ 140610ae-7c40-11eb-1763-832cd66375f7
fieldnames(Point)

# ╔═╡ Cell order:
# ╠═426b5c90-7c3f-11eb-3f2f-9dde1b32247f
# ╠═d1c962e0-7c44-11eb-3d44-458c17db2497
# ╠═549df61e-7c3f-11eb-084e-c569635b421c
# ╠═624affb4-7c3f-11eb-382c-ff02831d8a5f
# ╠═03178496-7c48-11eb-17a2-0933ef395323
# ╠═e523e4f0-7c44-11eb-3ec5-5fb18d2e5b46
# ╠═b3f0fd0a-7c3f-11eb-1639-31ab166f1b37
# ╠═140610ae-7c40-11eb-1763-832cd66375f7
