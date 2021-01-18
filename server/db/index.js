const low = require('lowdb')
const FileSync = require('lowdb/adapters/FileSync')

const adapter = new FileSync('server/db/db.json')
const db = low(adapter)

const createPostModel = require('./post')

module.exports = {
  models: {
    Post: createPostModel(db),
  },
  db
}