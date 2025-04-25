document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("contact_Form");

    form.addEventListener("submit", async (event) => {
        event.preventDefault(); // Stop form from refreshing the page

        const name = form.elements["name"].value.trim();
        const email = form.elements["email"].value.trim();
        const message = form.elements["Message"].value.trim(); // Ensure your input field's name is exactly "Message"

        // Form validation
        if (!isValidName(name)) {
            alert("Name must be at least 3 characters long.");
            return;
        }

        if (!isValidEmail(email)) {
            alert("Please enter a valid email address.");
            return;
        }

        if (message === "") {
            alert("Please enter your message.");
            return;
        }

        try {
            const formData = new FormData(form);
            const response = await fetch("contact.php", {
                method: "POST",
                body: formData,
            });

            const contentType = response.headers.get("content-type");
            const data = contentType && contentType.includes("application/json")
                ? await response.json()
                : await response.text();

            handleResponse(data);
        } catch (error) {
            console.error("Error submitting form:", error);
            alert("Something went wrong. Please try again later.");
        }
    });

    function isValidName(name) {
        return name.length >= 3;
    }

    function isValidEmail(email) {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }

    function handleResponse(data) {
        if (typeof data === "object" && data.success) {
            alert("Message submitted successfully!");
            document.getElementById("contact_Form").reset(); // Reset form fields
            window.location.href = "All.html"; // Redirect
        } else if (typeof data === "object") {
            alert("Error: " + data.error);
        } else {
            alert("Unexpected response: " + data);
        }
    }
});
