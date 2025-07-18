const express = require("express");
const PORT = 3000;

const app = express();

app.use(express.json()); // for parsing application/json

app.get("/", (req, res) => {
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
    console.log("req.body: ", req.body);
    console.log(
        "req.body.payload[0].newCells[0]: ",
        req.body.payload[0].newCells[0],
    );
    res.json({
        data: req.body.payload[0].newCells,
    });
});

app.listen(PORT, () => {
    console.log("Express.js listening on port ", PORT);
});
