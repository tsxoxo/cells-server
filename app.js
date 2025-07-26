const express = require("express");
const PORT = 3000;

const db = require("better-sqlite3")("cells.db", { verbose: console.log });

db.prepare(
    `CREATE TABLE IF NOT EXISTS cells (
  position INTEGER PRIMARY KEY,
  content TEXT NOT NULL,
  value TEXT,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);`,
).run();
const create_row = db.prepare(
    " INSERT INTO cells (position, content, value) VALUES (?, ?, ?) ",
);
const cell = db.prepare(" SELECT * FROM cells WHERE position = ? ");

const app = express();

app.use(express.json()); // for parsing application/json

app.get("/", (req, res) => {
    // TODO: Get the whole cells table
    // Probably process it to add a layer of indirection
    // and send Cell[] back to FE
    res.send("hey world");
});

app.options("/cells", (req, res) => {
    res.set({
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST",
        "Access-Control-Allow-Headers": "Content-Type",
    });
    res.send();
});

app.post("/cells", (req, res) => {
    res.set({
        "Access-Control-Allow-Origin": "*",
    });

    // START_HERE: forEach(cellInPayload => cell.get(cellInPayload.ownIndex))
    // if cellDB.content === cellPayload.oldContent then setToPayload, res(ok)
    // res(err, cellDB.content)

    // Add artificial delay to make UI reactions more pronounced
    setTimeout(
        () =>
            res.json({
                data: req.body.payload[0].newCells,
            }),
        2000,
    );
});

app.listen(PORT, () => {
    console.log("Express.js listening on port ", PORT);
});

const process = require("node:process");
process.on("SIGINT", () => db.close());
process.on("SIGTERM", () => db.close());
