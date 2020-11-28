# AnySet

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2FturboMaCk%2Fany-set%2Fbadge&style=flat)](https://actions-badge.atrox.dev/turboMaCk/any-set/goto)

Alternative set implementation for type-safe sets of any type.

This library solves the same problem as [truqu/elm-dictset](https://package.elm-lang.org/packages/truqu/elm-dictset/latest/)
just in a slightly different way. It's built on top of [`any-dict`](https://package.elm-lang.org/packages/turboMaCk/any-dict/latest/)
the same way the Set from elm/core is implemented on top of standard `Dict`. The only benefit is consistency across the two and
symmetry to core library implementations. In fact, dictset implementation is slightly more optimal since
it's built on top of standard `Dict` implementation and doesn't hold extra unit (`()`) constructor internally.
I encourage you to consider the pros and cons of both before picking one despite I believe that switching between the two should be pretty straightforward if needed.

API mirrors the standard `Set` as closely as possible.

Some parts of the documentation are stolen directly from [`elm/core`](http://package.elm-lang.org/packages/elm/core/latest).
