-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Blog.Query exposing (..)

import Blog.InputObject
import Blog.Interface
import Blog.Object
import Blog.Scalar
import Blog.ScalarCodecs
import Blog.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)


posts :
    SelectionSet decodesTo Blog.Object.Post
    -> SelectionSet (Maybe (List (Maybe decodesTo))) RootQuery
posts object_ =
    Object.selectionForCompositeField "posts" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


post :
    SelectionSet decodesTo Blog.Object.Post
    -> SelectionSet (Maybe decodesTo) RootQuery
post object_ =
    Object.selectionForCompositeField "post" [] object_ (identity >> Decode.nullable)
