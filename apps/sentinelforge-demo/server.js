const http = require("http");

const port = process.env.PORT || 8080;

const server = http.createServer((req, res) => {
  res.writeHead(200, {
    "Content-Type": "application/json"
  });

  res.end(
    JSON.stringify({
      service: "sentinelforge-demo",
      status: "healthy"
    })
  );
});

server.listen(port, "0.0.0.0", () => {
  console.log(`SentinelForge demo listening on port ${port}`);
});