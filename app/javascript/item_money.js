window.addEventListener('load', function(){
  const PriceInput = document.getElementById("item-price");
  PriceInput.addEventListener("input", function(){
    const InputValue = PriceInput.value
  
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = Math.floor(InputValue * 0.1);

    const Profit = document.getElementById("profit")
    Profit.innerHTML = Math.floor(InputValue * 0.9);
  })
});

