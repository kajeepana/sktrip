document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.querySelector("#loginForm");

  loginForm.addEventListener("submit", function (event) {
    event.preventDefault();

    const formData = new FormData(loginForm);

    fetch("login.php", {
      method: "POST",
      body: formData,
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          alert("Login successful!");
          window.location.href = "Itinerary.html";  
        } else {
          alert("Error: " + data.error);
        }
      })
      .catch((error) => {
        console.error("Error:", error);
        alert("Something went wrong. Please try again later.");
      });
  });
});