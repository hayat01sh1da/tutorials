app.component('review-list', {
  props: {
    reviews: {
      type: Array,
      required: true
    }
  },
  template:
  `
  <div  v-if="reviews.length" class="review-container">
  <h3>Reviews:</h3>
    <ul class="review-list">
      <li v-for="(review, index) in reviews" :key="index">
        Name: {{ review.name }} | Review: {{ review.review }} | Rating: {{ review.rating }}
      </li>
    </ul>
  </div>
  `
});
