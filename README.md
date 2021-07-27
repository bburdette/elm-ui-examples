# elm-ui-examples

This is a collection of tweaks, hacks, and examples that I've found helpful (or at least interesting), while building things with elm-ui.

Do you have some code that belongs here?  Contributions welcome.  Maybe some of these things will find their way into a more coherent form at some point.

Also check out rofrol's repo here:  https://github.com/rofrol/elm-ui-cookbook

# code block

I wanted a text area to display code - preserving whitespace but still doing line wrap.  This works as expected, wrapping on spaces and then breaking words if necessary.  https://ellie-app.com/dQTRJhnwV4za1

# (non) blinky fonts.

Using Element.Font.external results in blinky UI due to font reloading.

Here are a couple of ellies showing the blink problem and then fixing it by loading the font in the html.
 
Before, with blinking:  https://ellie-app.com/5JtKXXPmpKta1
After, blinking fixed:  https://ellie-app.com/5JvNzmS5Qxba1

# toggle

fancy animated toggle switch: https://ellie-app.com/85HbWTjCGWha1

# tooltips

tooltips plus some interesting 'never' usage:  https://ellie-app.com/7R2VHTzHJYYa1
