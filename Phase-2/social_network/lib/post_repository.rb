require_relative './post'

class PostRepository
    def all
        sql = 'SELECT * FROM posts;'
        posts = []
        result = DatabaseConnection.exec_params(sql,[])
        
        result.each do |record|
        post = Post.new
        post.id = record['id']
        post.title = record['title']
        post.content = record['content']
        post.views = record['views']
        post.user_id = record['user_id']

        posts.push(post)
        end
        return posts
    end

    def find(id)
        sql = 'SELECT (id, title, views) FROM posts WHERE id = $1'
        sql_params = [id]
        result = DatabaseConnection.exec_params(sql, sql_params)

        record = result[0]

        post = Post.new
        post.id = record['id']
        post.title = record['title']
        post.views = record['views']

        return post
    end

    def create(new_post)
        sql = 'INSERT INTO posts (id, title, content, views, user_id) VALUES ($1, $2, $3, $4, $5);'
        sql_params = [new_post.id, new_post.title, new_post.content, new_post.views, new_post.user_id]
        result = DatabaseConnection.exec_params(sql, sql_params)
        return nil
    end

end