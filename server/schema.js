// author will eventually have to be User type
const { gql } = require('apollo-server')

const typeDefs = gql`
  type Post {
    id: ID!
    title: String!
    body: String!
    author: String!
  }
  type User {
    name: String!
  }
  type Query {
    posts: [Post]
    post: Post
  }

  input PostInput {
    title: String!
    body: String!
    author: String!
  }
  type Mutation {
    createPost(input: PostInput!): Post!
    deletePost(input: ID!): [Post]
  }
`;

module.exports = typeDefs