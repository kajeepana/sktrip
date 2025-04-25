document.getElementById("registerForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent default form submission

    const username = document.getElementById("username").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();
    const confirmPassword = document.getElementById("confirmPassword").value.trim();

    // Basic validation for username
    if (username.length < 3) {
        alert("Username must be at least 3 characters long.");
        return;
    }

    // Basic email validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        alert("Please enter a valid email address.");
        return;
    }

    // Password validation: minimum 6 characters
    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return;
    }

    // Check if passwords match
    if (password !== confirmPassword) {
        alert("Passwords do not match. Please try again.");
        return;
    }

    const formData = new FormData(document.getElementById("registerForm")); // Collect form data

    fetch("register.php", {
        method: "POST",
        body: formData,
    })
    .then((response) => {
        const contentType = response.headers.get("content-type");
        if (contentType && contentType.includes("application/json")) {
            return response.json();
        } else {
            return response.text().then(text => {
                throw new Error("Unexpected response format: " + text);
            });
        }
    })
    .then((data) => {
        if (data.success) {
            alert("Registration successful!");
            window.location.href = "All.html#login"; // Redirect
        } else {
            alert("Error: " + data.error);
        }
    })
    .catch((error) => {
        console.error("Error:", error);
        alert("An error occurred: " + error.message);
    });
});
