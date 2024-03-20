const app = Vue.createApp({
  data() {
    return {
      github: {
        url: 'https://github.com/oasis-forever/vuejs_tutorial'
      },
      cart: [],
      premium: true
    }
  },
  methods: {
    pushItems(id) {
      this.cart.push(id);
    },
    removeItems(id) {
      this.cart.splice(this.cart.indexOf(id), 1);
    }
  }
});
