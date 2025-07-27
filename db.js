const db = require("better-sqlite3")("cells.db", { verbose: console.log });

db.prepare(
    `CREATE TABLE IF NOT EXISTS cells (
  position INTEGER PRIMARY KEY,
  content TEXT NOT NULL,
  value TEXT,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);`,
).run();

/**
 * Prepared statement for inserting cells
 * @type {import('better-sqlite3').Statement}
 */
const row = db.prepare(
    " INSERT INTO cells (position, content, value) VALUES (?, ?, ?) ",
);
const cell = db.prepare(" SELECT * FROM cells WHERE position = ? ");

/**
 * @param {number} position
 * @param {string} content
 * @param {string} value
 * @returns {import('better-sqlite3').RunResult}
 */
const insertCell = (position, content, value) => {
    return row.run(position, content, value);
};

module.exports = {
    connection: db,
    insertCell,
    cell,
};
