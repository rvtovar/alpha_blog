// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', () => {
    Alpine.start();

    // Handle flash messages
    document.querySelectorAll('.flash-message').forEach((el) => {
        el.querySelector('.close').addEventListener('click', () => {
            el.style.display = 'none';
        });
    });

    // Reset the open state to false for the navbar dropdown on each page load
    document.querySelectorAll('[x-data]').forEach((el) => {
        if (el.__x) {
            el.__x.$data.open = false;
        }
    });
});