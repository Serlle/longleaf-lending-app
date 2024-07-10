# Yacht Warriors Fullstack Developer Application

This project was created by Serlle Rosales as part of the application process for the Fullstack Developer position at Yacht Warriors, managed by Matt Weldent.

## Environment

- **Ruby Version**: 3.0.3
- **Rails Version**: 7.0.4
- **Database**: PostgreSQL
- **Testing Framework**: Minitest

## Installation

To install Ruby 3.0.3 and Rails 7.0.4 using a version manager (e.g., rbenv):

```bash
rbenv install 3.0.3
rbenv global 3.0.3
gem install rails -v 7.0.4
```

Make sure PostgreSQL is installed and configured.

## Running the Application

1. Clone the repository:
   ```bash
   git clone git@github.com:Serlle/longleaf-lending-app.git
   cd longleaf-lending-app
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:setup
   ```

4. Start the Rails server:
   ```bash
   rails server
   ```

5. Start Sidekiq for background job processing:
   ```bash
   bundle exec sidekiq
   ```

6. Access the application at `http://localhost:3000`.

## Running Tests

You can run tests using the following command:
```bash
bin/rails test
```

## Seed Data

The seed data includes one sample `RealEstate` entry, which you can view in detail at `/real_estates/:id`. You can also download its PDF version at `/real_estates/:id.pdf`. Alternatively, you can create your own `RealEstate` entry by filling out the form on the homepage.

## Sending Emails

To simulate sending emails, ensure Sidekiq is running (`bundle exec sidekiq`). Emails can be previewed using Letter Opener after creating a `RealEstate`.

## Contact
For any questions or inquiries, please contact Serlle Rosales - serlle.rosales96@gmail.com