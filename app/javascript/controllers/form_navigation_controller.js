import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-navigation"
export default class extends Controller {
  static targets = ["section"];

  initialize() {
    this.currentSectionIndex = 0;
    this.showCurrentSection();
  }

  next() {
    if (this.currentSectionIndex < this.sectionTargets.length - 1) {
      this.currentSectionIndex++;
      this.showCurrentSection();
    }
  }

  back() {
    if (this.currentSectionIndex > 0) {
      this.currentSectionIndex--;
      this.showCurrentSection();
    }
  }

  showCurrentSection() {
    this.sectionTargets.forEach((section, index) => {
      section.classList.toggle("hidden", index !== this.currentSectionIndex);
    });
  }
}