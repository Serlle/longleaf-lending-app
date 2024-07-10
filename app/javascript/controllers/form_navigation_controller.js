import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-navigation"
export default class extends Controller {
  static targets = ["section"];

  // Constructor
  initialize() {
    this.currentSectionIndex = 0;
    this.showCurrentSection();
  }

  // next action for button next
  next() {
    if (this.currentSectionIndex < this.sectionTargets.length - 1) {
      this.currentSectionIndex++;
      this.showCurrentSection();
    }
  }

  // back action for button back
  back() {
    if (this.currentSectionIndex > 0) {
      this.currentSectionIndex--;
      this.showCurrentSection();
    }
  }

  // method to show current section
  showCurrentSection() {
    this.sectionTargets.forEach((section, index) => {
      section.classList.toggle("hidden", index !== this.currentSectionIndex);
    });
  }
}