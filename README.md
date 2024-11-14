# PlantSort 🌱

PlantSort is a Rails 8 application designed to help gardeners organize and manage plants grown food, medicine, etc. With a structure reminiscent of a spreadsheet but more visually dynamic, PlantSort enables users to categorize plants by types like "Annual," "Perennial," "Fruit," "Vegetable," and "Medicinal." Users can create, edit, and categorize plants, allowing them to filter and view their collection by specific criteria. PlantSort brings a more interactive, gardener-friendly approach to plant organization than a typical spreadsheet.

## Features

- User Authentication: Users can sign up, log in, and manage their accounts (using Rails 8’s built-in authentication).
- Plant Management: Users can add, edit, and delete plants.
- Categorization: Assign plants to multiple categories for better organization.
- Filter by Category: Quickly filter plants by categories using Turbo and Stimulus for a smooth user experience.

## Installation

To run PlantSort locally:

1. Clone the repository:

```git clone https://github.com/your-username/plantsort.git cd plantsort```

2. Install dependencies: Make sure you have Bundler installed, then run:

```bundle install```

3. Set up the database:

```rails db:create db:migrate db:seed```

4. Run the server:

```rails server```

5. Open the app in your browser: Go to http://localhost:3000


## Usage

- Sign Up: Create an account to start managing plants.
- Add Plants: Fill in details like common name and taxonomic name, then assign categories.
- Filter by Categories: Use the category buttons on the index page to filter plants.

## Technologies Used

- Ruby on Rails 8: For the application backend.
- Bulma: CSS framework for styling.
- Turbo: To handle filtering plants without page reloads.
- Stimulus: For enhancing JavaScript functionality (if used).

## Future Improvements

No future improvements are planned at the moment, but if you have an idea for a feature that would benefit the app don't hesitate to reach out at plantsort@gmail.com

## Contributing

- Fork the repository.
- Create a new branch (git checkout -b feature/YourFeature).
- Commit your changes (git commit -m 'Add YourFeature').
- Push to the branch (git push origin feature/YourFeature).
- Open a Pull Request.

## License

MIT No Attribution

Copyright (c) 2024 Onathjan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.