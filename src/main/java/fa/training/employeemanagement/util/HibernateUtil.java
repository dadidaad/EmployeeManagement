package fa.training.employeemanagement.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class HibernateUtil {

    public static EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("JWD_L_A101DB");
        return factory.createEntityManager();
    }

//    public static void main(String[] args) {
//        EntityManager em = getEntityManager();
//        em.getTransaction().begin();
//        Employee e = new Employee("John", "Deep", 1, LocalDate.of(1998, 9, 21),
//                                "09212231321", "A101", "IT", "Nothing to say");
//        em.persist(e);
//        em.getTransaction().commit();
//        em.close();
//    }
}
