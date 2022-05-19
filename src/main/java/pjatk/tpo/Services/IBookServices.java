package pjatk.tpo.Services;

import org.hibernate.Session;
import pjatk.tpo.Entities.Author;
import pjatk.tpo.Entities.Book;
import pjatk.tpo.Entities.Publisher;

import java.util.Collection;

public interface IBookServices {
    Collection<Book> getBook(String isbn, String name, String year, String price, String author, String publisher);
    int getAuthorId(Session session, String authorName);
    int getPublisherId(Session session, String publisherName);
}
