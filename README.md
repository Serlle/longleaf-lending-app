# Longleaf Lending Lead Generation Form and Profit Calculator

## Project Overview

This project involves developing an in-house lead generation form and profit calculator for Longleaf Lending, replacing current third-party solutions. The application will collect user information, calculate potential profits, generate a termsheet PDF, and email it to users.

## Features

- **Form Creation**: Collects user inputs including address, loan term, purchase price, repair budget, ARV, name, email, and phone.
- **Logic Implementation**: Calculates estimated profit with constraints:
  - Loan amount funds up to 90% of the purchase price.
  - Loan amount cannot exceed 70% of ARV.
  - Profit is calculated as ARV minus total loan value and interest expense, with interest compounded monthly at 13% annually.
- **PDF Generation**: Produces a termsheet PDF with input details, calculated loan amount, and estimated profit.
- **Email Integration**: Sends the PDF to the user upon form submission using the `letter_opener` gem in development.

## Tech Stack

- **Backend**: Ruby on Rails
- **Styling**: Tailwind CSS
- **PDF Generation**: Prawn/Wicked PDF
- **Background Jobs**: Sidekiq
- **Email Handling**: `letter_opener` gem

## Setup Instructions

1. Clone the repository.
2. Install dependencies with `bundle install`.
3. Set up the database with `rails db:migrate`.
4. Run the application with `rails server`.
5. Use `letter_opener` for email previews during development.

## Thought Process and Design Decisions

- **Security**: Implement validations and secure data handling.
- **Scalability**: Use background jobs for email processing to improve performance.
- **User Experience**: Design a simple and intuitive form using Tailwind CSS.

## Evaluation Criteria

- Code quality and organization.
- Accurate implementation of form logic and calculations.
- Effective PDF generation and email integration.
- User-friendly design.

## Conclusion

This project demonstrates essential skills in building a full-stack application with Ruby on Rails, focusing on user experience, security, and scalability.