/*
Create tables for the library management database
This works for MySQL.

*/

CREATE TABLE category (
  id INT,
  category_name VARCHAR(100),
  CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE book (
  id INT,
  title VARCHAR(500),
  category_id INT,
  edition VARCHAR(15),
  copies_owned INT,
  publisher_id INT,
  author_id INT,
  CONSTRAINT pk_book PRIMARY KEY (id),
  CONSTRAINT fk_book_category FOREIGN KEY (category_id) REFERENCES category(id),
  CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES publisher(id),
  CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE author (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  CONSTRAINT pk_author PRIMARY KEY (id)
);

CREATE TABLE book_author (
  book_id INT,
  author_id INT,
  CONSTRAINT fk_book_author_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE publisher (
  id INT,
  publication_year INT,
  CONSTRAINT pk_publisher PRIMARY KEY (id)
);

CREATE TABLE member (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  joined_date DATE,
  CONSTRAINT pk_member PRIMARY KEY (id)
);

CREATE TABLE magazine (
  id INT,
  magazine_name VARCHAR(100),
  title VARCHAR(100),
  issue VARCHAR(50),
  editor_id INT,
  contributor_id INT,
  CONSTRAINT pk_magazine PRIMARY KEY (id),
  CONSTRAINT fk_magazine_editor FOREIGN KEY (editor_id) REFERENCES editor(id),
  CONSTRAINT fk_magazine_contributor FOREIGN KEY (contributor_id) REFERENCES contributor(id)
);

CREATE TABLE editor (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  CONSTRAINT pk_editor PRIMARY KEY (id)
);

CREATE TABLE contributor (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  CONSTRAINT pk_contributor PRIMARY KEY (id)
);

CREATE TABLE magazine_contributor_editor (
  magazine_id INT,
  editor_id INT,
  contributor_id INT,
  CONSTRAINT fk_magazine_editor FOREIGN KEY (editor_id) REFERENCES editor(id),
  CONSTRAINT fk_magazine_contributor FOREIGN KEY (contributor_id) REFERENCES contributor(id)
);

CREATE TABLE journal_articles (
  id INT,
  title VARCHAR(100),
  issue VARCHAR(50),
  author_id INT,
  editor_id INT,
  publisher_id INT,
  CONSTRAINT pk_journal_articles PRIMARY KEY (id),
  CONSTRAINT fk_journal_editor FOREIGN KEY (editor_id) REFERENCES journal_editor(id),
  CONSTRAINT fk_journal_publisher FOREIGN KEY (publisher_id) REFERENCES journal_publisher(id),
  CONSTRAINT fk_journal_author FOREIGN KEY (author_id) REFERENCES j_author(id)
);

CREATE TABLE journal_editor (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  CONSTRAINT pk_editor PRIMARY KEY (id)
);

CREATE TABLE publisher_editor (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  publication_date DATE,
  CONSTRAINT pk_publisher PRIMARY KEY (id)
);

CREATE TABLE j_author (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  CONSTRAINT pk_author PRIMARY KEY (id)
);

CREATE TABLE journal_author (
  journal_id INT,
  author_id INT,
  CONSTRAINT fk_journal FOREIGN KEY (journal_id) REFERENCES journal(id),
  CONSTRAINT fk_journalauthor FOREIGN KEY (j_author) REFERENCES j_author(id)
);

CREATE TABLE fine_payment (
  id INT,
  member_id INT,
  payment_date DATE,
  payment_amount INT,
  CONSTRAINT pk_fine_payment PRIMARY KEY (id),
  CONSTRAINT fk_finepay_member FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE loan (
  id INT,
  book_id INT,
  member_id INT,
  magazine_id INT,
  journal_articles_id INT,
  loan_date DATE,
  returned_date DATE,
  CONSTRAINT pk_loan PRIMARY KEY (id),
  CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES member(id),
  CONSTRAINT fk_loan_magazine FOREIGN KEY (magazine_id) REFERENCES magazine(id),
  CONSTRAINT fk_loan_journal FOREIGN KEY (journal_articles_id) REFERENCES journal_articles(id)
);


CREATE TABLE fine (
  id INT,
  book_id INT,
  magazine_id INT,
  journal_articles_id INT,
  loan_id INT,
  fine_date DATE,
  fine_amount INT,
  CONSTRAINT pk_fine PRIMARY KEY (id),
  CONSTRAINT fk_fine_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_fine_loan FOREIGN KEY (loan_id) REFERENCES loan(id),
  CONSTRAINT fk_loan_magazine FOREIGN KEY (magazine_id) REFERENCES magazine(id),
  CONSTRAINT fk_loan_journal FOREIGN KEY (journal_articles_id) REFERENCES journal_articles(id)
);
