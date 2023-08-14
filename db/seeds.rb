# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

unless User.any?
  User.create!(
    email: 'user@example.com',
    password: 'password123'
  )
end

unless Category.any?
  (1..4).each do |num|
    Category.create!(
      name: "Category %02d" % num,
      slug: "category-%02d" % num,
    )
  end
end

ADJECTIVES = %w(jumpy fluffy peachy magical tipsy snuggly daring bashful sneaky snooky gushy wimpy sniffly weepy wompy plumpy)
NOUNS = %w(boots hunter king prince princess love muffin paws cowboy wizard)

unless Product.any?
  (1..100).each do |num|
    name = '%s %s' % [
      ADJECTIVES.sample,
      NOUNS.sample
    ]
    while Product.where(name: name.titleize).any?
      name = '%s %s' % [
        ADJECTIVES.sample,
        NOUNS.sample
      ]
    end

    # Make the product:
    product = Product.create!(
      name: name.titleize,
      slug: name.parameterize,
      image_url: 'products/%03d.jpeg' % ((num % 20) + 1),
      price_usd: (20..100).to_a.sample + 0.99,
      is_active: (rand() < 0.2)
    )

    # Add the product to some categories:
    categories = Category.order('RANDOM()').limit(2)
    product.categories << categories
    product.save!
  end
end
