package pjatk.tpo.Services;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import pjatk.tpo.Entities.Author;
import pjatk.tpo.Entities.Book;
import pjatk.tpo.Entities.Publisher;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class BookServices implements IBookServices{

    private static SessionFactory factory;

    public BookServices() {
        factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Book.class)
                .addAnnotatedClass(Author.class)
                .addAnnotatedClass(Publisher.class)
                .buildSessionFactory();
    }

    public Collection<Book> getBook(String isbn, String name, String year, String price, String authorName, String publisherName) {

        List<Book> books = null;
        try (Session session = factory.getCurrentSession()) {
            session.beginTransaction();

            String authorId = "%";
            try {
                if (!authorName.equals("%")) {
                    authorId = "";
                    authorId = String.valueOf(getAuthorId(session, authorName));
                }
            }catch (NoResultException e){
                return new ArrayList<>();
            }

            String publisherId = "%";
            try {
                if(!publisherName.equals("%")) {
                    publisherId = "";
                    publisherId = String.valueOf(getPublisherId(session, publisherName));
                }
            }catch (NoResultException e){
                return new ArrayList<>();
            }

            String hql = "FROM Book " +
                    "WHERE ISBN LIKE :paramIsbn " +
                    "AND Name LIKE :paramName " +
                    "AND RealiseYear LIKE :paramRealiseYear " +
                    "AND Price LIKE :paramPrice " +
                    "AND AuthorID LIKE :paramAuthorID " +
                    "AND PublisherID LIKE :paramPublisherID";

            books = session.createQuery(hql)
                    .setParameter("paramIsbn", isbn)
                    .setParameter("paramName", name)
                    .setParameter("paramRealiseYear", year)
                    .setParameter("paramPrice", price)
                    .setParameter("paramAuthorID", authorId)
                    .setParameter("paramPublisherID", publisherId)
                    .getResultList();

            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            factory.close();
            e.printStackTrace();
        }
        return books;
    }

    public int getAuthorId(Session session, String authorName) {
        String hql = "SELECT id FROM Author " +
                "WHERE Name = :paramAuthorName";
        return (Integer)session.createQuery(hql)
                .setParameter("paramAuthorName", authorName).getSingleResult();
    }

    public int getPublisherId(Session session, String publisherName) {
        String hql = "SELECT id FROM Publisher " +
                "WHERE Name = :paramPublisherName";
        return (Integer)session.createQuery(hql)
                .setParameter("paramPublisherName", publisherName).getSingleResult();
    }

    public static void closeFactory(){
        factory.close();
    }
}
