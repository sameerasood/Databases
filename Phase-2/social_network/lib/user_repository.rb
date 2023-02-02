require_relative './user'


class UserRepository
    def all
        sql = 'SELECT id, username, email_address FROM users;'
        result = DatabaseConnection.exec_params(sql, [])
        users = []

        result.each do |record|
        user = User.new
        user.id = record['id']
        user.username = record['username']
        user.email_address = record['email_address']

        users.push(user)

        end
        return users
    end

    def find(id)
        sql = 'SELECT id, username, email_address FROM users WHERE id = $1'
        sql_params = [id]
        result = DatabaseConnection.exec_params(sql, sql_params)
        record = result[0]
        user = User.new
        user.id = record['id']
        user.username = record['username']
        user.email_address = record['email_address']
        return user
    end

    def create(new_user)
        sql = 'INSERT INTO users(id, username, email_address) VALUES ($1, $2, $3);'
        sql_params = [new_user.id, new_user.username, new_user.email_address]
        result = DatabaseConnection.exec_params(sql, sql_params)
    return nil
    end

    def delete(id)
        sql = 'DELETE FROM users WHERE id = $1'
        sql_params = [id]
        DatabaseConnection.exec_params(sql, sql_params)

        return nil
    end
end