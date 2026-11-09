user = User.new
p user.valid?
p user.errors.full_messages

user.name = "a" * 51
p user.valid?
p user.errors[:name]

u1 = User.create!(name: "Amir", email: "AMIR@EXAMPLE.COM", password: "foobar", password_confirmation: "foobar")
p u1.reload.email

u2 = User.new(name: "Test", email: "amir@example.com", password: "foobar", password_confirmation: "foobar")
p u2.valid?
p u2.errors[:email]

p u1.password_digest
p u1.authenticate("wrong_pass")
p u1.authenticate("foobar")

bad_user = User.new(name: "Bad", email: "bad@ex.com", password: "password", password_confirmation: "mismatch")
p bad_user.valid?
p bad_user.errors[:password_confirmation]

p User.find(u1.id)
p User.find_by(email: "amir@example.com")
p User.first
p User.count
