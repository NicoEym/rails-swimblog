const initScroll = () => {
  const button = document.getElementById('button_scroll');
  const container = document.querySelector('.container');
  const footer = document.getElementById('footer');
  const banner = document.querySelector('.banner');

  if (button) {
    button.addEventListener('click', (e) => {
        if (container.classList.contains("hidden-style")) {
          container.classList.remove("hidden-style");
          footer.classList.remove("hidden-style");

        }
      container.scrollIntoView({behavior: "smooth", block: "start"});;
      // banner.classList.add("hidden-style");

    });

  }
};

export { initScroll };
