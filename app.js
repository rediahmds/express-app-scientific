const os = require('os');
const express = require('express');
const app = express();
const port = 3000;

const hostname = os.hostname();

app.get('/', (req, res) => {
  res.send(`A warm hello from ${hostname}`);
});

app.listen(port, () => {
  console.log(`Express App Scientific listening on port ${port}`);
});
