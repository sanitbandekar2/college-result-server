let array = ["11", "12", "13", "14", "15", "16"];

for (let index = 0; index < array.length; index++) {
  const data = { username: "example" };

  fetch("http://localhost:3001/api/resultSemUpdate", {
    method: "POST", // or 'PUT'
    headers: {
      "           Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  })
    .then((response) => response.json())
    .then((data) => {
      console.log("Success:", data);
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}
