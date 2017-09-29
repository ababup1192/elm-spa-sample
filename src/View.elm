module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (id, class)
import Html.Events exposing (onClick)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    let
        -- Modelによってコンテンツの切り替え
        content =
            case model of
                Foo ->
                    contentFoo

                Bar ->
                    contentBar

                Hoge ->
                    contentHoge

                NotFound ->
                    notFound

        contentContainer =
            div [ class "tabs-content" ] [ content ]
    in
        -- headerは共通化
        div [ class "container" ]
            [ header model
            , contentContainer
            ]



-- header(メニュー)


header : Model -> Html Msg
header model =
    let
        -- クリック時に ClickLink メッセージを発行
        attributes x =
            [ onClick <| ClickLink x ]

        htmlText x =
            [ text <| toString x ]

        -- 現在アクティブなメニューにactiveクラスを付与
        tabs =
            List.map
                (\x ->
                    if model == x then
                        div (class "active" :: attributes x) <| htmlText x
                    else
                        div (attributes x) <| htmlText x
                )
                [ Foo, Bar, Hoge, NotFound ]
    in
        div [ class "tabs-menu" ]
            tabs



-- コンテンツ群


contentFoo : Html Msg
contentFoo =
    p [] [ text "ContentFoo" ]


contentBar : Html Msg
contentBar =
    h1 [] [ text "ContentBar" ]


contentHoge : Html Msg
contentHoge =
    ul []
        [ li [] [ text "ContentHoge-1" ]
        , li [] [ text "ContentHoge-2" ]
        , li [] [ text "ContentHoge-3" ]
        ]


notFound : Html Msg
notFound =
    h1 [] [ text "Page Not found" ]
