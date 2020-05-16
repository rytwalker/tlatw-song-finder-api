const fetch = require("node-fetch");

module.exports = async function ({
  slug = "",
  method = "get",
  body = null,
  access_token,
}) {
  const options = {
    method,
    headers: {
      Authorization: `Bearer ${access_token}`,
    },
  };

  if (body) {
    options.body = body;
    options.headers["Content-Type"] = "application/x-www-form-urlencoded";
  }

  return await fetch(`https://api.spotify.com/v1/${slug}`, options);
};
