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

# ╔═╡ 26995708-7c48-11eb-292e-f5effea02a60
using Luxor, Colors

# ╔═╡ c1f665a8-7c48-11eb-21e3-4d9277a2a1e6
using PlutoUI

# ╔═╡ 2f24ef60-7c48-11eb-0b2f-4789dd832825
function boing(n)
	t = Turtle()
	background("gray10")
	Pencolor(t, "red")
	
	for i = 1:n
		Forward(t, i)
		HueShift(t)
		Turn(t, 89.5)
	end
end

# ╔═╡ b2c13ce8-7c48-11eb-19df-1783d848b618
@bind n Slider(1:1:600)

# ╔═╡ 2f240258-7c48-11eb-0e32-7d7fe5b75a5b
@png boing(n) 500 500 "boing.png"

# ╔═╡ 8859b442-7c4a-11eb-11b1-e9662ef9a41d
function backdrop(scene, framenumber)
	background("gray10")
end

# ╔═╡ 939bded4-7c4a-11eb-3856-1fe1b0dfad4a
function frame(scene, framenumber)
	eased_n = scene.easingfunction(framenumber, 1, scene.opts*2, scene.framerange.stop)
	boing(eased_n)
end

# ╔═╡ 720918b8-7c4a-11eb-3ba8-811805f313c9
function animate_boing(frames)
	demo = Movie(500, 500, "boing")
	
	animate(demo, [
    	Scene(demo, backdrop, 0:frames),
    	Scene(demo, frame, 0:frames, easingfunction=easeoutcirc, optarg=frames)
	],
    creategif=true,
	framerate=60,
	pathname="boing7.gif")
end

# ╔═╡ 3f1ed34c-7c4b-11eb-02a7-ed300f2dd30a
animate_boing(300)

# ╔═╡ Cell order:
# ╠═26995708-7c48-11eb-292e-f5effea02a60
# ╠═c1f665a8-7c48-11eb-21e3-4d9277a2a1e6
# ╠═2f24ef60-7c48-11eb-0b2f-4789dd832825
# ╠═2f240258-7c48-11eb-0e32-7d7fe5b75a5b
# ╠═b2c13ce8-7c48-11eb-19df-1783d848b618
# ╠═8859b442-7c4a-11eb-11b1-e9662ef9a41d
# ╠═939bded4-7c4a-11eb-3856-1fe1b0dfad4a
# ╠═720918b8-7c4a-11eb-3ba8-811805f313c9
# ╠═3f1ed34c-7c4b-11eb-02a7-ed300f2dd30a
