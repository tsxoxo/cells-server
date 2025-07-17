const express = require("express");
const PORT = 3000;

const app = express();

app.get("/", (req, res) => {
    res.send("hey world");
});

app.post("/cells/:id", (req, res) => {
    res.send(`post request to cell id hohoho ${req.params.id}`);
});

app.listen(PORT, () => {
    console.log("Express.js listening on port ", PORT);
});
