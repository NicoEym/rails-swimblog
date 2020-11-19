const initScroll = () => {
  const button = document.getElementById('button_scroll');
  const map_container = document.getElementById('map_page');
  if (button) {
    button.addEventListener('click', (e) => {
      map_container.scrollIntoView({behavior: "smooth", block: "start"});;

    });

  }
};

export { initScroll };
