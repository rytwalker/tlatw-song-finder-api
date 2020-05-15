const app = require("./app");
const chalk = require("chalk");

const PORT = process.env.PORT || 4000;

app.listen(4000, () => {
  console.log("\n", chalk.blueBright("*********************************"));
  console.log(` App is running on Port: ${chalk.blue.underline(PORT)}`);
  console.log(chalk.blueBright(" *********************************"), "\n");
});
