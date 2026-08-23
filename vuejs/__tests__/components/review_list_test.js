"use strict;"

const { mount } = require("@vue/test-utils");
const { component } = require("../support/load_app");

const REVIEWS = [
  { name: "Oasist", review: "Warm and smell-proof.", rating: 5 },
  { name: "Hayato", review: "A bit thin.", rating: 3 }
];

const mountList = (reviews) => mount(component("review-list"), { props: { reviews } });

describe("review-list", () => {
  test("renders nothing at all when there are no reviews", () => {
    const wrapper = mountList([]);
    expect(wrapper.find(".review-container").exists()).toBe(false);
    expect(wrapper.html()).toBe("<!--v-if-->");
  });

  test("renders the container and heading once there is a review", () => {
    const wrapper = mountList(REVIEWS);
    expect(wrapper.find(".review-container").exists()).toBe(true);
    expect(wrapper.find("h3").text()).toBe("Reviews:");
  });

  test("renders one list item per review", () => {
    expect(mountList(REVIEWS).findAll(".review-list li")).toHaveLength(2);
  });

  test("renders the name, review and rating of each review", () => {
    const items = mountList(REVIEWS).findAll(".review-list li");
    expect(items[0].text()).toBe("Name: Oasist | Review: Warm and smell-proof. | Rating: 5");
    expect(items[1].text()).toBe("Name: Hayato | Review: A bit thin. | Rating: 3");
  });

  test("re-renders when the reviews prop grows", async () => {
    const wrapper = mountList([REVIEWS[0]]);
    expect(wrapper.findAll(".review-list li")).toHaveLength(1);

    await wrapper.setProps({ reviews: REVIEWS });
    expect(wrapper.findAll(".review-list li")).toHaveLength(2);
  });

  test("declares reviews as a required array prop", () => {
    expect(component("review-list").props.reviews).toStrictEqual({
      type: Array,
      required: true
    });
  });
});
