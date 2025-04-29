import "@hotwired/turbo-rails"

document.addEventListener("turbo:load", function () {
  const hamburger = document.getElementById("hamburger-btn");
  const nav = document.getElementById("header-nav");

  if (hamburger && nav) {
    hamburger.addEventListener("click", function () {
      nav.classList.toggle("open");
    });
  }
});
