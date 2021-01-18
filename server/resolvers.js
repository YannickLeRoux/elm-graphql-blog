const { models } = require('./db')

module.exports = {
  Query: {
    posts(_, {input}, {models}) {
      return models.Post.findMany(input || {})
    },
    post(_, {id}, {models}) {
      return models.Post.findOne({id})
    }
  },
  Mutation: {
    createPost(_, {input}, {models}) {
      const newPost = models.Post.create(input)
      return newPost
    },
    deletePost(_, {input}, {models}) {
      return models.Post.deletePost(input)
    }
  }
}