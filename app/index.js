const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Kubeforge CI/CD platform is live 🚀");
});

const PORT = 8080;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
