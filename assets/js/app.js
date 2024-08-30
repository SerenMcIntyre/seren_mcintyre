// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken}
})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

document.addEventListener("DOMContentLoaded", function () {
  const toggleNavButton = document.getElementById("toggle-nav");
  const navMenu = document.getElementById("navbar-mobile");

  toggleNavButton.addEventListener("click", function () {
    navMenu.classList.toggle("expanded");
  });

  const skillSections = document.querySelectorAll('.skill-section');
  for (let skillSection of skillSections) {
    const card = skillSection.querySelector(`.card`);
    const colour = skillSection.querySelector(`#${skillSection.id}-colour`);
    const showColour = () => {
      resetSkillSections(skillSections, skillSection);
      colour.classList.toggle('hidden');
      colour.classList.toggle('show-drawing');

      card.classList.toggle('h-0');
      card.classList.toggle('h-64');
      card.classList.toggle('invisible');
    }
    skillSection.addEventListener("click", showColour);
  }
})


const resetSkillSections = (sections, target) => {
  for (let section of sections) {
    if (section.id === target.id) {
      continue;
    }

    const colour = section.querySelector(`#${section.id}-colour`);
    const card = section.querySelector(`.card`);

    // Reset colour element
    if (colour.classList.contains('show-drawing')) {
      colour.classList.remove('show-drawing');
      colour.classList.add('hidden');
    }

    // Reset card element
    if (!card.classList.contains('h-0')) {
      card.classList.add('h-0');
      card.classList.remove('h-64');
      card.classList.add('invisible');
    }
  }
}
