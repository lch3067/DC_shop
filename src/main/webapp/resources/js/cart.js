/**
 * 
 */
 /*
 (function () {
  const $ = (sel, root=document) => root.querySelector(sel);
  const $$ = (sel, root=document) => Array.from(root.querySelectorAll(sel));

  const fmt = (n) => {
    const num = typeof n === 'number' ? n : parseFloat(n || 0);
    return '$' + num.toFixed(2);
  };

  async function post(url, bodyObj) {
    const headers = { 'Content-Type': 'application/json' };

    const res = await fetch(url, {
      method: 'POST',
      headers,
      body: JSON.stringify(bodyObj || {})
    });
    if (!res.ok) throw new Error('Network error');
    return res.json();
  }

  function updateItemQtyDom(cardEl, newQty) {
    const qtyEl = $('.qty', cardEl);
    if (qtyEl) qtyEl.textContent = newQty;
  }

  function removeItemDom(id) {
    const card = document.querySelector(`.cart-item[data-id="${id}"]`);
    if (card) card.remove();
  }

  function updateSummaryDom(summary) {
    const subtotalEl = $('#summarySubtotal');
    const shippingEl = $('#summaryShipping');
    const taxEl      = $('#summaryTax');
    const totalEl    = $('#summaryTotal');
    const stickyTot  = $('#cartTotal');
    const itemsText  = $('#itemsCountText');
    const sticky     = $('#stickyFooter');

    if (subtotalEl) subtotalEl.textContent = fmt(summary.subtotal || 0);
    if (shippingEl) shippingEl.textContent = (summary.shippingFee || 0) === 0 ? 'Free' : fmt(summary.shippingFee);
    if (taxEl)      taxEl.textContent      = fmt(summary.tax || 0);
    if (totalEl)    totalEl.textContent    = fmt(summary.total || 0);
    if (stickyTot)  stickyTot.textContent  = fmt(summary.total || 0);
    if (itemsText)  itemsText.textContent  = `(${summary.itemsCount} item${summary.itemsCount > 1 ? 's':''})`;

    // 비었으면 비어있음 섹션 보여주기
    const hasItems = (summary.itemsCount || 0) > 0;
    const itemsWrap = $('#cartItems');
    const emptyView = $('#emptyCart');
    if (itemsWrap && emptyView) {
      if (!hasItems) {
        itemsWrap.innerHTML = '';
        emptyView.classList.remove('d-none');
        if (sticky) sticky.classList.add('d-none');
      }
    }
  }

  async function handleInc(id, cardEl) {
    const data = await post(window.CART_API.inc, { id });
    // 기대하는 응답(JSON):
    // { success:true, item:{id, qty}, cart:{itemsCount, subtotal, shippingFee, tax, total} }
    updateItemQtyDom(cardEl, data.item.qty);
    updateSummaryDom(data.cart);
  }

  async function handleDec(id, cardEl) {
    const data = await post(window.CART_API.dec, { id });
    updateItemQtyDom(cardEl, data.item.qty);
    updateSummaryDom(data.cart);
  }

  async function handleRemove(id) {
    const data = await post(window.CART_API.rmv, { id });
    removeItemDom(id);
    updateSummaryDom(data.cart);
  }

  // 이벤트 위임
  document.addEventListener('click', (e) => {
    const incBtn = e.target.closest('.js-inc');
    const decBtn = e.target.closest('.js-dec');
    const rmvBtn = e.target.closest('.js-remove');

    if (!incBtn && !decBtn && !rmvBtn) return;

    const id = (incBtn||decBtn||rmvBtn).dataset.id;
    const card = e.target.closest('.cart-item');

    if (incBtn)  handleInc(id, card).catch(console.error);
    if (decBtn)  handleDec(id, card).catch(console.error);
    if (rmvBtn)  handleRemove(id).catch(console.error);
  });

})();
*/