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

# ╔═╡ ff9de46a-7cb3-11eb-3d0a-41c763671f20
using Luxor, Colors, PlutoUI

# ╔═╡ 0972cbf2-7cb4-11eb-3309-a772deb54308
function color_circles(x)
	b = blend(Point(-200, 0), Point(200, 0), "orange", "blue")
	# hues = colormap("Oranges", 11)
	hues = range(colorant"purple", colorant"white", length=11)
	for (i, colr) in zip(110:-10:0, hues)
		# randomhue()
		# sethue(1 - 1 * i / 110, 0.4 - 1 * i / 110, 1 - 0.4 * i / 110)
		sethue(colr)
		circle(i*x, 0, i, :fill)
	end
end

# ╔═╡ 2b5cedb2-7cb9-11eb-33a2-4f2e02ee742a
@bind x Slider(-1.0:0.05:1.0)

# ╔═╡ 4123ccf6-7cb9-11eb-0a81-87b0cc299d39
@svg color_circles(x) 500 250 "color_circles_slide"

# ╔═╡ 0e403470-7cb7-11eb-24b2-4bee851633b4
function backdrop(scene, framenumber)
    background("white")
end

# ╔═╡ a642bac6-7cb8-11eb-0f12-450f251ea610
function frame(scene, framenumber)
	n = scene.easingfunction(framenumber, -1, 4, scene.framerange.stop)
	if n > 1
		n = 2 - n
	end
	color_circles(n)
end

# ╔═╡ bb178434-7cb8-11eb-2199-472c37a336eb
begin
	demo = Movie(500, 250, "color_circles")
	animate(demo, [
	    Scene(demo, backdrop, 0:250),
	    Scene(demo, frame, 0:250,
	        easingfunction=easingflat)
	    ],
	    creategif=true,
		pathname="color_circles_easingflat_onion.gif")
end

# ╔═╡ 625687c0-7cc0-11eb-187e-6919e50e5c34
range(colorant"red", colorant"green", length=11)

# ╔═╡ Cell order:
# ╠═ff9de46a-7cb3-11eb-3d0a-41c763671f20
# ╠═0972cbf2-7cb4-11eb-3309-a772deb54308
# ╠═2b5cedb2-7cb9-11eb-33a2-4f2e02ee742a
# ╠═4123ccf6-7cb9-11eb-0a81-87b0cc299d39
# ╟─0e403470-7cb7-11eb-24b2-4bee851633b4
# ╟─a642bac6-7cb8-11eb-0f12-450f251ea610
# ╠═bb178434-7cb8-11eb-2199-472c37a336eb
# ╠═625687c0-7cc0-11eb-187e-6919e50e5c34
