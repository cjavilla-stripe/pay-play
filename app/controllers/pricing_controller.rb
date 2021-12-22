class PricingController < ApplicationController
  def index
    @prices = Stripe::Price.list(
      type: 'recurring',
      lookup_keys: [
        'freelancer',
        'startup',
        'enterprise'
      ],
      expand: ['data.product'],
    )
    @prices.each do |price|
      if !price.product.metadata['features'].blank?
        price.features = JSON.parse(price.product.metadata.features)
      else
        price.features = []
      end
    end
    @prices = @prices.sort_by {|price| price.unit_amount}
  end
end
