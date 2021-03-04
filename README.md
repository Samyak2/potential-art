# potential-art

Some drawings made using [Luxor.jl](https://github.com/JuliaGraphics/Luxor.jl/).

All of the examples are [Pluto.jl notebooks](https://github.com/fonsp/Pluto.jl/), some of them have interactive sliders for you to play around with.

<sup><sub>These creations only touch the surface of what's possible using Luxor, check out the [Luxor documentation](http://juliagraphics.github.io/Luxor.jl/stable/examples/) for more examples</sub></sup>

# Showcase

## [Barnsley's Fern](./src/barnsley_fern.jl)

![Barnsley's fern example 1](./results/barnsley_fern_1.png)
![Barnsley's fern example 2](./results/barnsley_fern_2.png)

[Barnsley's fern](https://en.wikipedia.org/wiki/Barnsley_fern) is a fractal that looks like a fern. It only takes a few lines of code to generate this. (logic/algo borrowed from the python example on the Wikipedia article linked above)

## [Boing](./src/boing.jl)

![Boing example animation](./results/boing7.gif)

A beautiful animation of what looks like a rotating square changing colors and leaving behind a trail. The design was borrowed from the first example for Turtle in the [documentation](http://juliagraphics.github.io/Luxor.jl/stable/turtle/). <sup><sub>The name does not make any sense I know.</sub></sup>

## [Colored circles](./src/color_circles.jl) (and [more colored circles](./src/more_color_circles.jl))

![Colored circles example](./results/color_circles_easeinoutcubic.gif)
![Colored circles example 2](./results/color_circles_easingflat_onion.gif)

Some circles inside other circles and they are colored. <sup><sub>Very creative name</sub></sup>

# Why?

Because I was bored and I found an old TODO note from my past self asking me to try making Barnsley's fern in python. I used Julia instead. I liked Luxor and Pluto so much that I wanted to play around more.

# License

MIT License because why not.
