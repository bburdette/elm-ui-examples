
{- there's a bug where the multiline control doesn't show the text passed in to 'text', 
   instead you get old text or text from a different instance of multiline.  
   This workaround seems to fix it. 
-}
workAroundMultiLine :
    List (Attribute msg)
    ->
        { onChange : String -> msg
        , text : String
        , placeholder : Maybe (EI.Placeholder msg)
        , label : EI.Label msg
        , spellcheck : Bool
        }
    -> Element msg
workAroundMultiLine attribs mlspec =
    EI.multiline (htmlAttribute (HA.property "value" (JE.string mlspec.text)) :: attribs)
        mlspec


