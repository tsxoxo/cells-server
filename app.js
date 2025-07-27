const express = require("express");
const PORT = 3000;

const db = require("./db.js");

const app = express();

app.use(express.json()); // for parsing application/json

// DEBUG
app.use((req, res, next) => {
    console.log(`${req.method} ${req.path}`);
    next();
});

app.get("/", (req, res) => {
    // TODO: Get the whole cells table
    // Probably process it to add a layer of indirection
    // and send Cell[] back to FE
    res.send("hey worldjasd");
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

    // what is the shape of req?
    db.insertCell(12, "121212", "121212");
    console.log("inserted");

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
}).on("error", (err) => {
    console.error("Server failed to start:", err.message);
    process.exit(1);
});

const process = require("node:process");
process.on("SIGTERM", () => {
    console.log("Received SIGTERM, shutting down gracefully");
    db.connection.close();
    process.exit(0);
});
process.on("SIGINT", () => {
    console.log("Received SIGTERM, shutting down gracefully");
    db.connection.close();
    process.exit(0);
});
