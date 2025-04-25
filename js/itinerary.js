document.addEventListener("DOMContentLoaded", () => {
    const saveButton = document.getElementById("save-btn");
    const clearButton = document.getElementById("clear-btn");
    const tripForm = document.getElementById("trip-form");

    saveButton.addEventListener("click", (event) => {
        event.preventDefault(); // prevent default form submission
        const destination = document.getElementById("destination").value;
        const startDate = document.getElementById("start-date").value;
        const endDate = document.getElementById("end-date").value;
    
        if (!destination || !startDate || !endDate) {
            alert("Please fill in all the required fields: destination, start date, and end date.");
            return;
        }
    
        if (new Date(startDate) > new Date(endDate)) {
            alert("Start date cannot be after the end date.");
            return;
        }
    
        tripForm.submit(); // now it's safe
    });
    

    clearButton.addEventListener("click", () => {
        if (confirm("Are you sure you want to clear the form?")) {
            tripForm.reset();
        }
    });
});
