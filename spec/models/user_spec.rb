require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a first name, last name, email, and password' do
    user = User.new(
      first_name: 'sample',
      last_name: 'test',
      email: 'example@mail.com',
      password: 'asdfjkll'
    )
    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it 'is invalid without a last name' do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it 'is invalid without an email'

  it 'is invalid with a duplicate email' do
    User.create(
      first_name: 'sample',
      last_name: 'hoi',
      email: 'example@mail.com',
      password: 'asdfghjkl'
    )
    user = User.new(
      first_name: 'test',
      last_name: 'kii',
      email: 'example@mail.com',
      password: 'asdfghjkl'
    )
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'returns a user\'s full name as a string' do
    user = User.new(
      first_name: 'sample',
      last_name: 'test',
      email: 'exaple@mail.com',
      password: 'asdfghkkl'
    )
    expect(user.name).to eq 'sample test'
  end
end
