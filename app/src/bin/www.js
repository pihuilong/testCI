/* eslint-disable no-console */
/* eslint-disable no-plusplus */
import * as http from "http";

const port = 3000;

let visited = 0;

const requestHandler = (request, response) => {
  console.log(request.url);
  response.end(
    `This test site have been visited: ${++visited} times. <h1>This site belongs to Hiram Pierce, all right reserved!</h1>`
  );
};

const server = http.createServer(requestHandler);

server.listen(port, err => {
  if (err) {
    console.log("something bad happened", err);
  }

  console.log(`server is listening on ${port}`);
});
