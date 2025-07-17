const express = require("express");
const PORT = 3000;

const app = express();

app.get("/", (req, res) => {
    res.send("hey world");
});

app.options("/cells/:id", (req, res) => {
    res.set({
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST",
        "Access-Control-Allow-Headers": "Content-Type",
    });
    res.send();
});

app.post("/cells/:id", (req, res) => {
    res.set({
        "Access-Control-Allow-Origin": "*",
    });
    res.json({
        data: `post request to cell id hohoho ${req.params.id}`,
    });
});

app.listen(PORT, () => {
    console.log("Express.js listening on port ", PORT);
});
