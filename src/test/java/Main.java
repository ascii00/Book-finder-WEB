import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import pjatk.tpo.Entities.Author;
import pjatk.tpo.Entities.Book;
import pjatk.tpo.Entities.Publisher;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration()
                    .configure("hibernate.cfg.xml")
                    .addAnnotatedClass(Book.class)
                    .addAnnotatedClass(Author.class)
                    .addAnnotatedClass(Publisher.class)
                    .buildSessionFactory();

        try (Session session = factory.getCurrentSession()) {
            session.beginTransaction();

            String hql = "SELECT id FROM Author " +
                    "WHERE Name = :paramAuthorName";
            int id = (Integer)session.createQuery(hql)
                    .setParameter("paramAuthorName", "Author2").getSingleResult();

            System.out.println(id);

            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            factory.close();
            e.printStackTrace();
        }
    }
}
