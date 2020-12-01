function count (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const priceInput = itemPrice.value
    const taxPrice  = document.getElementById("add-tax-price");
    taxPrice.innerHTML = `${priceInput * 0.1}`;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${priceInput * 0.9}`;
  });
}

window.addEventListener('load', count);