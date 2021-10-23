ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'tasks.db')

class Task < ActiveRecord::Base
    validates :name,:content, presence: true
end