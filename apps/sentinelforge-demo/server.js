const http = require("http");

const port = process.env.PORT || 8080;

const server = http.createServer((req, res) => {
  res.writeHead(500, {
    "Content-Type": "application/json"
  });

  res.end(
    JSON.stringify({
      service: "sentinelforge-demo",
      status: "failure",
      version: "v3-bad-release"
    })
  );
});

server.listen(port, "0.0.0.0", () => {
  console.log(`SentinelForge bad release listening on port ${port}`);
});