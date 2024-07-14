const { hostname } = require('os');
const { ip } = require('address');

const retrieveHostInfo = () => {
  const hostName = hostname();
  const ipv4 = ip();
  return { hostName, ipv4 };
};

module.exports = { retrieveHostInfo };
