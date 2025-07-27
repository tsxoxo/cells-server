const z = require("zod");

const Cell = z.object({
    // raw user input
    content: z.string(),
    // only set when formula is successfully interpreted
    value: z.number().optional(),
    // indices of cells used in formula
    dependencies: z.array(z.number()),
    // cells that reference this cell
    dependents: z.array(z.number()),
    ownIndex: z.number(),
});

const UIError = z.object({
    msg: z.string(),
    token: {
        start: z.number(),
        value: z.string(),
    },
    cellIndex: z.number(),
});

const Payload = z.object({
    newCells: z.array(Cell),
    oldCells: z.array(Cell),
    errors: UIError.optional(),
});

module.exports = {
    Payload,
};
