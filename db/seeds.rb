admin = User.new(
 name:     'Admin User',
 email:    'admin@example.com',
 password: '12345678',
 role:     'admin'
)
admin.skip_confirmation!
admin.save!

standard = User.new(
 name:     'Standard User',
 email:    'standard@example.com',
 password: '12345678',
 role:     'standard'
)
standard.skip_confirmation!
standard.save!

premium = User.new(
 name:     'Premium User',
 email:    'premium@example.com',
 password: '12345678',
 role:     'premium' 
)
premium.skip_confirmation!
premium.save!