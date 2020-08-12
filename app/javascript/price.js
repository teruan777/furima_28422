window.addEventListener('load', function(){
  const pricehtml = document.getElementById("item-price");
  pricehtml.addEventListener("input", (e) => {
    const price = document.getElementById("item-price").value;
      let price_tax1 = price / 10;
      let profit1 = price - price_tax1;
      const price_tax = Math.floor(price_tax1);
      const profit = Math.floor(profit1);
      const add_tax_price = document.getElementById('add-tax-price')
      const profit2 = document.getElementById('profit')
      add_tax_price.innerHTML = price_tax;
      profit2.innerHTML = profit;
  });
})
