"use strict;"

const { mount } = require("@vue/test-utils");
const { component, globalComponents } = require("../support/load_app");

const mountDisplay = ({ premium = true, cart = [] } = {}) =>
  mount(component("product-display"), {
    props: { premium, cart },
    global: { components: globalComponents() }
  });

const cartText = (wrapper) => wrapper.find(".cart").text();
const buttons = (wrapper) => wrapper.findAll(".cart button");
const addButton = (wrapper) => buttons(wrapper)[0];
const removeButton = (wrapper) => buttons(wrapper)[1];

describe("product-display rendering", () => {
  test("renders the title as the brand followed by the name", () => {
    expect(mountDisplay().find("h1").text()).toBe("Vue Mastery Great Socks");
  });

  test("renders the description, the price and the on-sale banner", () => {
    const text = mountDisplay().text();
    expect(text).toContain("Description: Smell-proof socks");
    expect(text).toContain("Price: 980 JPY for 3 pairs");
    expect(mountDisplay().find(".on-sale").text()).toBe("On Sale Now!");
  });

  test("renders the image of the selected variant with the description as alt text", () => {
    const img = mountDisplay().find(".product-image img");
    expect(img.attributes("src")).toBe("./assets/images/socks_green.jpg");
    expect(img.attributes("alt")).toBe("Smell-proof socks");
  });

  test("renders every size", () => {
    const text = mountDisplay().text();
    ["S", "M", "L", "XL"].forEach((size) => expect(text).toContain(size));
  });

  test("renders one colour circle per variant", () => {
    const circles = mountDisplay().findAll(".color-circle");
    expect(circles).toHaveLength(2);
    expect(circles[0].attributes("style")).toContain("green");
    expect(circles[1].attributes("style")).toContain("blue");
  });

  // Known quirk: the ingredients list is written out twice in the template.
  test("renders the ingredients list twice", () => {
    const ingredients = mountDisplay()
      .findAll("li")
      .filter((item) => item.text() === "50% cotton");
    expect(ingredients).toHaveLength(2);
  });
});

describe("product-display shipping", () => {
  test("is free for premium customers", () => {
    expect(mountDisplay({ premium: true }).text()).toContain("Shipping: Free");
  });

  test("costs 700 JPY otherwise", () => {
    expect(mountDisplay({ premium: false }).text()).toContain("Shipping: 700 JPY");
  });
});

describe("product-display cart", () => {
  test("reports an empty cart", () => {
    expect(cartText(mountDisplay({ cart: [] }))).toContain("Cart: 0");
  });

  test("counts every entry in the cart, duplicates included", () => {
    expect(cartText(mountDisplay({ cart: [2234, 2234, 2235] }))).toContain("Cart: 3");
  });

  test("emits add-to-cart when the add button is clicked", async () => {
    const wrapper = mountDisplay();
    await addButton(wrapper).trigger("click");
    expect(wrapper.emitted("add-to-cart")).toHaveLength(1);
  });

  // Known quirk: the guard reads `this.cart !== 0`, and an array is never
  // equal to 0, so the event is emitted even when the cart is empty.
  test("emits remove-from-cart even when the cart is empty", async () => {
    const wrapper = mountDisplay({ cart: [] });
    await removeButton(wrapper).trigger("click");
    expect(wrapper.emitted("remove-from-cart")).toHaveLength(1);
  });
});

describe("product-display stock", () => {
  test("pluralises the stock status of the 10-item variant", () => {
    expect(cartText(mountDisplay())).toContain("10 items remain");
  });

  test("uses the singular verb for the 1-item variant", async () => {
    const wrapper = mountDisplay();
    await wrapper.findAll(".color-circle")[1].trigger("mouseover");
    expect(cartText(wrapper)).toContain("1 item remains");
  });

  test("leaves both buttons enabled while the variant is in stock", () => {
    expect(addButton(mountDisplay()).attributes("disabled")).toBeUndefined();
    expect(removeButton(mountDisplay()).attributes("disabled")).toBeUndefined();
  });

  test("disables both buttons and greys out the image when the variant is sold out", async () => {
    const wrapper = mountDisplay();
    wrapper.vm.variants[0].quantity = 0;
    await wrapper.vm.$nextTick();

    expect(addButton(wrapper).attributes("disabled")).toBeDefined();
    expect(removeButton(wrapper).attributes("disabled")).toBeDefined();
    expect(addButton(wrapper).classes()).toContain("disabledButton");
    expect(wrapper.find(".product-image img").classes()).toContain("outOfStockImg");
  });

  test("reports a sold-out variant with the zero-quantity wording", async () => {
    const wrapper = mountDisplay();
    wrapper.vm.variants[0].quantity = 0;
    await wrapper.vm.$nextTick();

    expect(cartText(wrapper)).toContain("0 item remain");
  });
});

describe("product-display variant selection", () => {
  test("starts on the first variant", () => {
    expect(mountDisplay().vm.selectedVariant).toBe(0);
  });

  test("swaps the image when another colour circle is hovered", async () => {
    const wrapper = mountDisplay();
    await wrapper.findAll(".color-circle")[1].trigger("mouseover");

    expect(wrapper.vm.selectedVariant).toBe(1);
    expect(wrapper.find(".product-image img").attributes("src"))
      .toBe("./assets/images/socks_blue.jpg");
  });

  test("swaps back when the first colour circle is hovered again", async () => {
    const wrapper = mountDisplay();
    await wrapper.findAll(".color-circle")[1].trigger("mouseover");
    await wrapper.findAll(".color-circle")[0].trigger("mouseover");

    expect(wrapper.find(".product-image img").attributes("src"))
      .toBe("./assets/images/socks_green.jpg");
  });
});

describe("product-display reviews", () => {
  const REVIEW = { name: "Oasist", review: "Warm and smell-proof.", rating: 5 };

  test("hides the review list until a review has been left", () => {
    expect(mountDisplay().find(".review-container").exists()).toBe(false);
  });

  test("renders a review emitted by the review form", async () => {
    const wrapper = mountDisplay();
    await wrapper.findComponent(component("review-form")).vm.$emit("review-submitted", REVIEW);

    expect(wrapper.vm.reviews).toStrictEqual([REVIEW]);
    expect(wrapper.find(".review-list li").text())
      .toBe("Name: Oasist | Review: Warm and smell-proof. | Rating: 5");
  });

  test("keeps every review that is submitted", async () => {
    const wrapper = mountDisplay();
    const form = wrapper.findComponent(component("review-form"));
    await form.vm.$emit("review-submitted", REVIEW);
    await form.vm.$emit("review-submitted", { ...REVIEW, name: "Hayato", rating: 3 });

    expect(wrapper.findAll(".review-list li")).toHaveLength(2);
  });
});

describe("product-display contract", () => {
  test("declares premium and cart as required props", () => {
    expect(component("product-display").props).toStrictEqual({
      premium: { type: Boolean, required: true },
      cart: { type: Array, required: true }
    });
  });
});
