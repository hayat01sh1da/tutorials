app.component('product-display', {
  props: {
    premium: {
      type: Boolean,
      required: true
    },
    cart: {
      type: Array,
      required: true
    }
  },
  template:
  `
  <div class="product-display">
    <div class="product-container">
      <div class="product-image">
        <img
          :class="{ outOfStockImg: !inStock }"
          :src="image"
          :alt="this.description">
      </div>
      <div class="product-info">
        <p v-show="this.onSale" class="on-sale on-sale-labal">On Sale Now!</p>
        <h1>{{ title }}</h1>
        <p class="item">Description: {{ this.description }}</p>
        <ul class="item">
          <li>Ingredients:</li>
          <li v-for="ingredient in this.ingredients">{{ ingredient }}</li>
        </ul>
        <ul class="item">
          <li>Sizes:</li>
          <li v-for="size in this.sizes">{{ size }}</li>
        </ul>
        <p class="item">Shipping: {{ shipping }}</p>
        <p class="item">Price: {{ this.price }}</p>
        <ul class="item">
          <li>Ingredients:</li>
          <li v-for="ingredient in this.ingredients">{{ ingredient }}</li>
        </ul>
        <ul class="item">
          <li>Colour:</li>
          <li
            v-for="(variant, index) in this.variants"
            :key="variant.id"
            @mouseover="updateVariant(index)"
            class="color-circle"
            :style="{ backgroundColor: variant.color }">
          </li>
        </ul>
      </div>
      <div class="cart">
        <p>{{ stockStatus }}</p>
        <p>Cart: {{ itemsInCart }}</p>
        <button
          class="button"
          :class="{ disabledButton: !inStock }"
          @click="addToCart"
          :disabled="!inStock">
          Add to cart
        </button>
        <button
          class="button"
          :class="{ disabledButton: !inStock }"
          @click="removeFromCart"
          :disabled="!inStock">
          Remove from cart
        </button>
      </div>
    </div>
  </div>
  <div class="review">
    <review-list v-if:"review.length" :reviews="reviews"></review-list>
    <review-form @review-submitted="addReview"></review-form>
  </div>
  `,
  data() {
    return {
      onSale: true,
      name: 'Great Socks',
      brand: 'Vue Mastery',
      description: 'Smell-proof socks',
      ingredients: ['50% cotton', '30% wool', '20% polyester'],
      sizes: ['S', 'M', 'L', 'XL'],
      price: '980 JPY for 3 pairs',
      img: './assets/images/socks_green.jpg',
      selectedVariant: 0,
      variants: [
        {
          id: 2234,
          color: 'green',
          img: './assets/images/socks_green.jpg',
          quantity: 10
        },
        {
          id: 2235,
          color: 'blue',
          img: './assets/images/socks_blue.jpg',
          quantity: 1
        }
      ],
      reviews: []
    };
  },
  methods: {
    addToCart() {
      this.$emit('add-to-cart');
    },
    removeFromCart() {
      if (this.cart !== 0) {
        this.$emit('remove-from-cart');
      }
    },
    updateVariant(index) {
      this.selectedVariant = index;
    },
    addReview(review) {
      this.reviews.push(review)
    }
  },
  computed: {
    title() {
      return `${this.brand} ${this.name}`
    },
    image() {
      return this.variants[this.selectedVariant].img
    },
    stockStatus() {
      const counter = this.variants[this.selectedVariant].quantity >= 2 ? 'items' : 'item';
      const verb = this.variants[this.selectedVariant].quantity === 1 ? 'remains' : 'remain';
      return `${this.variants[this.selectedVariant].quantity} ${counter} ${verb}`
    },
    inStock() {
      if (this.variants[this.selectedVariant].quantity !== 0) {
        return true;
      }
    },
    shipping() {
      if (this.premium) {
        return 'Free';
      }
      return '700 JPY';
    },
    itemsInCart() {
      return this.cart.length;
    }
  }
});
