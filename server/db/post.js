const {nanoid} = require('nanoid')

const createPostModel = db => {
  return {
    findMany(filter) {
      return db.get('posts')
        .filter(filter)
        .value()
    },

    findOne(filter) {
      return db.get('posts')
        .find(filter)
        .value()
    },

    create(post) {
      const newPost = {id: nanoid(), createdAt: Date.now(), ...post}

      db.get('posts')
        .push(newPost)
        .write()

      return newPost
    },
    deletePost(id) {
      db.get('posts').remove({id}).write()
      return `Deleted pet with id: ${id}`
    }
  }
}

module.exports = createPostModel