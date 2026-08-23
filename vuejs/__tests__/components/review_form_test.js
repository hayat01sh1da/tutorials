"use strict;"

const { mount } = require("@vue/test-utils");
const { component } = require("../support/load_app");

const mountForm = () => mount(component("review-form"));

const fillIn = async (wrapper, { name, review, rating }) => {
  await wrapper.find("#name").setValue(name);
  await wrapper.find("#review").setValue(review);
  await wrapper.find("#rating").setValue(rating);
};

describe("review-form", () => {
  let alertSpy;

  beforeEach(() => {
    alertSpy = jest.spyOn(window, "alert").mockImplementation(() => {});
  });

  afterEach(() => {
    alertSpy.mockRestore();
  });

  test("renders a name field, a review field and a rating select", () => {
    const wrapper = mountForm();
    expect(wrapper.find("input#name").exists()).toBe(true);
    expect(wrapper.find("textarea#review").exists()).toBe(true);
    expect(wrapper.find("select#rating").exists()).toBe(true);
    expect(wrapper.find("h3").text()).toBe("Leave a review");
  });

  test("offers the ratings 5 down to 1", () => {
    const options = mountForm().findAll("#rating option").map((option) => option.text());
    expect(options).toStrictEqual(["5", "4", "3", "2", "1"]);
  });

  test("starts with every field blank", () => {
    expect(mountForm().vm.name).toBe("");
    expect(mountForm().vm.review).toBe("");
    expect(mountForm().vm.rating).toBeNull();
  });

  test("emits the completed review on submit", async () => {
    const wrapper = mountForm();
    await fillIn(wrapper, { name: "Oasist", review: "Warm and smell-proof.", rating: "5" });
    await wrapper.find("form").trigger("submit");

    expect(wrapper.emitted("review-submitted")).toStrictEqual([[{
      name: "Oasist",
      review: "Warm and smell-proof.",
      rating: 5
    }]]);
  });

  test("coerces the rating to a number through v-model.number", async () => {
    const wrapper = mountForm();
    await fillIn(wrapper, { name: "Oasist", review: "Warm and smell-proof.", rating: "3" });
    await wrapper.find("form").trigger("submit");

    expect(typeof wrapper.emitted("review-submitted")[0][0].rating).toBe("number");
  });

  test("clears every field after a successful submit", async () => {
    const wrapper = mountForm();
    await fillIn(wrapper, { name: "Oasist", review: "Warm and smell-proof.", rating: "5" });
    await wrapper.find("form").trigger("submit");

    expect(wrapper.vm.name).toBe("");
    expect(wrapper.vm.review).toBe("");
    expect(wrapper.vm.rating).toBeNull();
  });

  test.each([
    ["the name is blank", { name: "", review: "Warm and smell-proof.", rating: "5" }],
    ["the review is blank", { name: "Oasist", review: "", rating: "5" }]
  ])("alerts and emits nothing when %s", async (_label, fields) => {
    const wrapper = mountForm();
    await fillIn(wrapper, fields);
    await wrapper.find("form").trigger("submit");

    expect(alertSpy).toHaveBeenCalledWith("Review is incomplete. Please fill out every field.");
    expect(wrapper.emitted("review-submitted")).toBeUndefined();
  });

  test("alerts and emits nothing when no rating has been picked", async () => {
    const wrapper = mountForm();
    await wrapper.find("#name").setValue("Oasist");
    await wrapper.find("#review").setValue("Warm and smell-proof.");
    await wrapper.find("form").trigger("submit");

    expect(alertSpy).toHaveBeenCalledWith("Review is incomplete. Please fill out every field.");
    expect(wrapper.emitted("review-submitted")).toBeUndefined();
  });

  test("keeps what was already typed when the submit is rejected", async () => {
    const wrapper = mountForm();
    await wrapper.find("#name").setValue("Oasist");
    await wrapper.find("form").trigger("submit");

    expect(wrapper.vm.name).toBe("Oasist");
  });

  test("does not reload the page on submit", async () => {
    const wrapper = mountForm();
    await fillIn(wrapper, { name: "Oasist", review: "Warm and smell-proof.", rating: "5" });
    const event = new Event("submit", { cancelable: true, bubbles: true });
    wrapper.find("form").element.dispatchEvent(event);

    expect(event.defaultPrevented).toBe(true);
  });
});
