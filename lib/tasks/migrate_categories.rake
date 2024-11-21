namespace :categories do
  desc "Migrate universal categories to user-specific categories"
  task migrate_to_user_specific: :environment do
    universal_categories = Category.where(user_id: nil)

    User.find_each do |user|
      universal_categories.each do |category|
        user.categories.find_or_create_by(name: category.name)
      end
    end

    puts "Migration completed!"
  end
end
