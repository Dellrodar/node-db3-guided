const db = require("../data/config");

function findPostsByUserID(userID) {
  // no await needed as we are returning a promise directly
  return db("posts as p")
      .innerJoin("users as u", "u.id", "p.user_id")
      .where("p.user_id", userID)
      .select("p.id", "p.contents", "u.username")
}

module.exports = {
  findPostsByUserID,
}