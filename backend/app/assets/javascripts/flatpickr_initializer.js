document.addEventListener("DOMContentLoaded", () => {
    console.log("Flatpickr initializer loaded");
    flatpickr("#date-range-picker", {
      mode: "range",
      dateFormat: "Y-m-d",
    });
  });
  