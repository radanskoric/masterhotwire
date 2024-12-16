import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    priceId: String,
    discountCode: String
  }

  connect() {
    if(!this.priceIdValue) {
      console.warn("No priceId provided for checkout button!", this.element);
    }

    const urlParams = new URLSearchParams(window.location.search);
    const discountFromUrl = urlParams.get('discount');
    if (discountFromUrl) {
      this.discountCodeValue ||= discountFromUrl;
    }
  }

  start() {
    Paddle.Checkout.open({
      discountCode: this.discountCodeValue,
      items: [
        {
          priceId: this.priceIdValue,
          quantity: 1
        }
      ]
    });
  }
}
