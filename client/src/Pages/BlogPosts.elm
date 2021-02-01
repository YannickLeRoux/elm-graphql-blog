module Pages.BlogPosts exposing (Model, Msg, Params, page)

import Blog.Object
import Blog.Object.Post as Post
import Blog.Query as Query
import Blog.ScalarCodecs
import Element exposing (Element, alignRight, centerY, el, fill, padding, rgb255, row, spacing, text, width)
import GraphQLClient exposing (makeGraphQLQuery)
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import RemoteData exposing (RemoteData)
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url exposing (Url)


page : Page Params Model Msg
page =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Params =
    ()


type alias Model =
    PostsData


init : Url Params -> ( Model, Cmd Msg )
init url =
    ( initialModel
    , fetchPosts
    )


type alias Post =
    { id : Blog.ScalarCodecs.Id
    , title : String
    , body : String
    , author : String
    , createdAt : Int
    }


type alias Posts =
    List Post



-- type GraphQLResponse decodesTo
--     = GraphQLResponse (RemoteData (Graphql.Http.Error decodesTo) decodesTo)


type alias PostsData =
    RemoteData (Graphql.Http.Error Posts) Posts


type Msg
    = FetchPostsSuccess PostsData


initialModel : Model
initialModel =
    RemoteData.Loading


postSelection : SelectionSet Post Blog.Object.Post
postSelection =
    SelectionSet.map5 Post
        Post.id
        Post.title
        Post.body
        Post.author
        Post.createdAt


fetchPostsQuery : SelectionSet (Maybe (List (Maybe Post))) RootQuery
fetchPostsQuery =
    Query.posts postSelection


fetchPosts : Cmd Msg
fetchPosts =
    makeGraphQLQuery
        fetchPostsQuery
        (RemoteData.fromResult >> FetchPostsSuccess)



-- UPDATE


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchPostsSuccess response ->
            ( response, Cmd.none )



-- VIEW


view : Model -> Document Msg
view model =
    { title = "Posts"
    , body =
        [ el [] (text "Posts")
        ]
    }
