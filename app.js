const express = require('express');
const { retrieveHostInfo } = require('./utils/sysinfos');
const { createBody } = require('./utils/body');
const app = express();
const port = process.env.PORT | 8080;

const { hostName, ipv4 } = retrieveHostInfo();

app.get('/', (req, res) => {
  const body = createBody(hostName, ipv4);
  res.send(body);
});

app.listen(port, () => {
  console.log(`Express App Scientific listening on port http://localhost:${port}`);
});
