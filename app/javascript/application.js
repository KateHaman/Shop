// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import 'jquery-ujs'

document.addEventListener("turbo:load", () => {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-ba-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
})
