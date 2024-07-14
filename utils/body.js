const createBody = (hostName, ipv4) => {
  const h1 = `<h1>Server Details</h1>`;
  const p1 = `<p><b>Host name: ${hostName}</b></p>`;
  const p2 = `<p><b>IPv4: ${ipv4}</b></p>`;

  const body = `
		${h1}
		${p1}
		${p2}
		`;
  return body;
};

module.exports = { createBody };
