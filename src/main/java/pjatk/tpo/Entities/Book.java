package pjatk.tpo.Entities;

import javax.persistence.*;

@Entity
@Table(name = "Book")
public class Book {

    @Id
    @Column(name = "ISBN")
    private int isbn;

    @Column(name = "NAME")
    private String name;

    @Column(name = "REALISEYEAR")
    private int realiseYear;

    @Column(name = "PRICE")
    private int price;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "AuthorID")
    private Author author;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "PublisherID")
    private Publisher publisher;

    public Book() {
    }

    public Book(int isbn, String name, int realiseYear, int price, Author author, Publisher publisher) {
        this.isbn = isbn;
        this.name = name;
        this.realiseYear = realiseYear;
        this.price = price;
        this.author = author;
        this.publisher = publisher;
    }

    public int getIsbn() {
        return isbn;
    }

    public String getName() {
        return name;
    }

    public int getRealiseYear() {
        return realiseYear;
    }

    public int getPrice() {
        return price;
    }

    public Author getAuthor() {
        return author;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    @Override
    public String toString() {
        return "Book - " + name +
                " | ISBN - " + isbn +
                " | Release year - " + realiseYear +
                " | Price - " + price +
                " | Author - " + author.getName() +
                " | Publisher - " + publisher.getName();
    }
}
