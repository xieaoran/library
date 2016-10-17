package com.xieaoran.library.Actions;

import com.opensymphony.xwork2.ActionSupport;
import com.xieaoran.library.Entities.Book;
import com.xieaoran.library.Factories.SqlHelper;
import org.hibernate.Session;

/**
 * Created by xieaoran on 2016/10/7.
 */
public class BookInfoAction extends ActionSupport {
    private Long isbn;
    private Book resultBook;
    private Integer pageType;
    private String message;

    public Long getIsbn() {
        return isbn;
    }

    public void setIsbn(Long isbn) {
        this.isbn = isbn;
    }

    public Book getResultBook() {
        return resultBook;
    }

    public void setResultBook(Book resultBook) {
        this.resultBook = resultBook;
    }

    public Integer getPageType() {
        return pageType;
    }

    public void setPageType(Integer pageType) {
        this.pageType = pageType;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    @SuppressWarnings("unchecked")
    public String execute() throws Exception {
        Session session = SqlHelper.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Book sqlBook = (Book) session.createQuery("select book " +
                    "from Book book " +
                    "where book.isbn = :isbn")
                    .setParameter("isbn", getIsbn())
                    .getSingleResult();
            session.close();
            setResultBook(sqlBook);
            setPageType(0);
            return SUCCESS;
        } catch (Exception e) {
            session.close();
            throw e;
        }
    }

    public String delete() throws Exception{
        Session session = SqlHelper.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Book sqlBook = (Book) session.createQuery("select book " +
                    "from Book book " +
                    "where book.isbn = :isbn")
                    .setParameter("isbn", getIsbn())
                    .getSingleResult();
            session.close();
            setResultBook(sqlBook);
            setPageType(1);
            return SUCCESS;
        } catch (Exception e) {
            session.close();
            throw e;
        }
    }

    public String deleteSubmit() throws Exception {
        Session session = SqlHelper.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Book sqlBook = (Book) session.createQuery("select book " +
                    "from Book book " +
                    "where book.isbn = :isbn")
                    .setParameter("isbn", getIsbn())
                    .getSingleResult();
            session.delete(sqlBook);
            session.getTransaction().commit();
            session.close();
            setResultBook(sqlBook);
            setPageType(2);
            setMessage("图书删除成功。");
            return SUCCESS;
        } catch (Exception e) {
            session.close();
            throw e;
        }
    }
}
