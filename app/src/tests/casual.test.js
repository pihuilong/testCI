/* eslint-disable no-console */
const { add } = require("../temp");

describe("Empty test for test", () => {
  it("should return total of two numbers", () => {
    const total = add(2, 3);

    expect(total).toBe(5);
  });
});
