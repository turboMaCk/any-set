# AnySet

Alternative set implementation for type-safe sets of any type.

This library safe the same problem as [truqu/dictset](https://package.elm-lang.org/packages/truqu/elm-dictset/latest/)
just in a slightly different way. It's build on top of [`any-dict`](https://package.elm-lang.org/packages/turboMaCk/any-dict/latest/)
same way standard Set is implemented on top of standard `Dict`. The only benefit is consistency accros the two and
symetry to core library implementations. In fact dictset lib implementation is slightly more optimal since
it's being build on top of standard `Dict` implementation so it doesn't hold extra unit (`()`) constructor internally.
I encourage you to consider pros and cons of both before picking one despite path of switching between the two is pretty straight forward.

API mirrirs the standard `Set` exactly where possible.

Some parts of the documentation are stolen directly from [`elm-lang/core`](http://package.elm-lang.org/packages/elm-lang/core/latest).
