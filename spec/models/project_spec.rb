require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'does not allowed duplicate project names per user' do
    user = User.create(
      first_name: 'sample',
      last_name: 'test',
      email: 'example@mail.com',
      password: 'asdfghjkl'
    )
    user.projects.create(
      name: 'Test Project'
    )
    new_project = user.projects.build(
      name: 'Test Project'
    )
    new_project.valid?
    expect(new_project.errors[:name]).to include('has already been taken')
  end

  it 'allows two users to share a project name' do
    user = User.create(
      first_name: 'sample',
      last_name: 'test',
      email: 'example@mail.com',
      password: 'asdfghjkl',
    )
    user.projects.create(
      name: 'Test Project'
    )
    other_user = User.create(
      first_name: 'hoi',
      last_name: 'kiil',
      email: 'sample@mail.com',
      password: 'asdfghkl'
    )
    other_project = other_user.projects.build(
      name: 'Test Project'
    )
    other_project.valid?
    expect(other_project).to be_valid
  end
end
