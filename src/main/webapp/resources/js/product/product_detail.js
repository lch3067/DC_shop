// /resources/js/product/product_detail.js  (또는 /resources/js/product_detail.js)
document.addEventListener('DOMContentLoaded', () => {
  const tabs   = document.querySelectorAll('.pd-tabs .tab');
  const panels = document.querySelectorAll('.pd-panel');

  function activate(tab){
    tabs.forEach(t => {
      const on = t === tab;
      t.classList.toggle('is-active', on);
      t.setAttribute('aria-selected', on ? 'true' : 'false');
    });
    panels.forEach(p => p.classList.remove('active'));
    const target = document.getElementById(tab.getAttribute('aria-controls'));
    if (target) target.classList.add('active');
  }

  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      activate(tab);
      const anchor = document.querySelector('.pd-bottom');
      if (anchor){
        const y = window.pageYOffset + anchor.getBoundingClientRect().top - 90;
        window.scrollTo({ top: y, behavior: 'smooth' });
      }
    });
  });
});