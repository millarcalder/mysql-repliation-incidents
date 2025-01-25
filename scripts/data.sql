USE library;

CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE users_books (
    user_id INT,
    book_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    PRIMARY KEY (user_id, book_id)
);

INSERT INTO books (title, author) VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald'),
    ('The Catcher in the Rye', 'J.D. Salinger'),
    ('To Kill a Mockingbird', 'Harper Lee'),
    ('1984', 'George Orwell'),
    ('Pride and Prejudice', 'Jane Austen');

INSERT INTO users (name, email) VALUES
    ('John Doe', 'john.doe@example.com'),
    ('Jane Smith', 'jane.smith@example.com'),
    ('Alice Johnson', 'alice.johnson@example.com'),
    ('Bob Brown', 'bob.brown@example.com'),
    ('Charlie Davis', 'charlie.davis@example.com');

INSERT INTO users_books (user_id, book_id) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (4, 1),
    (4, 3),
    (5, 2),
    (5, 4),
    (5, 5);
