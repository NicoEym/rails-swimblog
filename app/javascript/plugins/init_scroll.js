const initScroll = () => {
  const button = document.getElementById('button_scroll');
  const map_container = document.getElementById('map-page');
  const card_container = document.getElementById('card-container');
  const footer = document.getElementById('footer');
  if (button) {
    button.addEventListener('click', (e) => {
        if (map_container.classList.contains("hidden-style")) {
          map_container.classList.remove("hidden-style");
        }
      map_container.scrollIntoView({behavior: "smooth", block: "start"});;


    });

  }
};

export { initScroll };
