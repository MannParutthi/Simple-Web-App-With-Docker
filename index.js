const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('Hello World! This is a simple Node.js app running in a Docker container');
});

app.listen(8080, () => {
  console.log('Server is listening on port 8080');
});