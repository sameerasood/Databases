require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  it 'returns all posts' do
    repo = PostRepository.new
    post = repo.all
    expect(post.length).to eq 2 # =>  2
    expect(post.first.id).to eq '1' # =>  1
    expect(post.first.title).to eq 'Feb 2, 2023' # =>  'Feb 2, 2023'
    expect(post.first.views).to eq '8' # =>  '8'
  end

  it 'returns the post with id = 1' do
  repo = PostRepository.new
  post = repo.all
  expect(post.first.id).to eq '1'
  expect(post.first.title).to eq 'Feb 2, 2023'
  expect(post.first.views).to eq '8'
  end

  it 'creates new post' do
    repo = PostRepository.new
    new_post = Post.new
    new_post.id = '3'
    new_post.title = 'Wow'
    new_post.content = 'Cannot believe I am doing this'
    new_post.views = '15'
    new_post.user_id = '2'

    repo.create(new_post)
    all_posts = repo.all
    expect(all_posts).to include(
      have_attributes(
        id: '3',
        title: new_post.title,
        content: new_post.content,
        views: new_post.views,
        user_id: '2'
      )
    )
  end

end