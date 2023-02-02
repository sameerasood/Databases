require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

 it 'returns the list of all users' do
  repo = UserRepository.new
  users = repo.all
  expect(users.length).to eq 2 # =>  2
  expect(users.first.id).to eq '1' # =>  1
  expect(users.first.username).to eq 'Boris' # =>  'Boris'
  expect(users.first.email_address).to eq 'random@uk.com' # =>  'random@uk.com'
 end

 it 'returns the second user from the array' do
  repo = UserRepository.new
  user = repo.find(2)
  expect(user.id).to eq '2'
  expect(user.username).to eq 'Mark' #=> 'Mark'
  expect(user.email_address).to eq 'def@xyz.com' #=> 'def@xyz.com'
 end

  it 'adds a new user to the array' do
    repo = UserRepository.new
    new_user = User.new
    new_user.id = '3'
    new_user.username = 'Harry Potter'
    new_user.email_address = 'harry@hogwarts.com'

    repo.create(new_user)
    all_users = repo.all

    expect(all_users).to include(
        have_attributes(
            id: '3',
            username: new_user.username,
            email_address: new_user.email_address
        )
    )
  end

  it 'deletes a user with id =1 from the array' do
    repo = UserRepository.new
    repo.delete(1)
    all_users = repo.all
    expect(all_users.length).to eq 1
  end
end