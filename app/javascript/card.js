const pay = () => {
  if (window.location.href.match(/\/items\/\d+\/purchases/)) {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_house_add[number]"),
      cvc: formData.get("purchase_house_add[cvc]"),
      exp_month: formData.get("purchase_house_add[exp_month]"),
      exp_year: `20${formData.get("purchase_house_add[exp_year]")}`,
    };

  Payjp.createToken(card, (status, response) => {

    if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='purchase_house_add[token]'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        alert("Token can't be blank")
        const input = document.getElementById("itemID");
        const itemID = input.getAttribute('data-id')
        console.log(itemID) 
        location.href= `/items/${itemID}/purchases`;

      }
    });
  })};
};


window.addEventListener("load", pay);